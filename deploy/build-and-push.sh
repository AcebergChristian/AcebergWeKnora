#!/usr/bin/env bash
# 构建定制镜像推送到 Docker Hub, 并生成给别人的一键部署包
#
# 前置条件 (首次):
#   docker login -u <你的DockerHub用户名>
#
# 用法:
#   DOCKERHUB_USER=你的用户名 ./deploy/build-and-push.sh [镜像tag]
#   默认 tag 为 custom, 例如: DOCKERHUB_USER=zhangsan ./deploy/build-and-push.sh v1
#
# 可选环境变量:
#   PLATFORM=linux/amd64   目标架构 (Windows/Ubuntu 服务器均为 amd64, 一般不用改)
#   WITH_ANYDOC=1          设 0 可跳过 Rust 组件, 大幅缩短构建时间
#   NPM_REGISTRY=...       前端 npm 镜像 (默认 npmmirror)
#   SKIP_BUILD=1           跳过构建, 仅重新生成部署包
set -euo pipefail
cd "$(dirname "$0")/.."
ROOT=$PWD

DOCKERHUB_USER="${DOCKERHUB_USER:?用法: DOCKERHUB_USER=你的DockerHub用户名 $0 [镜像tag]}"
TAG="${1:-custom}"
PLATFORM="${PLATFORM:-linux/amd64}"
WITH_ANYDOC="${WITH_ANYDOC:-1}"
NPM_REGISTRY="${NPM_REGISTRY:-https://registry.npmmirror.com}"
SKIP_BUILD="${SKIP_BUILD:-0}"

if [ "$SKIP_BUILD" != "1" ]; then
    LOGGED_IN="$(docker system info --format '{{.Username}}' 2>/dev/null || true)"
    if [ "$LOGGED_IN" != "$DOCKERHUB_USER" ]; then
        echo "[错误] Docker 未以 ${DOCKERHUB_USER} 登录 (当前: ${LOGGED_IN:-未登录})"
        echo "       请先执行: docker login -u ${DOCKERHUB_USER}"
        exit 1
    fi

    echo "==> [1/3] 构建并推送 app 镜像 (platform=${PLATFORM}, WITH_ANYDOC=${WITH_ANYDOC})"
    if [ "$WITH_ANYDOC" = "1" ] && [ "$(uname -m)" != "x86_64" ]; then
        echo "    提示: 在 $(uname -m) 机器上跨架构构建 amd64 且含 Rust 组件, 可能需要 30-90 分钟。"
        echo "    想加速可中断后改用: WITH_ANYDOC=0 DOCKERHUB_USER=$DOCKERHUB_USER $0 $TAG"
    fi
    docker buildx build --platform "$PLATFORM" \
        -f docker/Dockerfile.app \
        --build-arg WITH_ANYDOC="$WITH_ANYDOC" \
        -t "${DOCKERHUB_USER}/weknora-app:${TAG}" \
        --push .

    echo "==> [2/3] 构建并推送 docreader 镜像"
    docker buildx build --platform "$PLATFORM" \
        -f docker/Dockerfile.docreader \
        -t "${DOCKERHUB_USER}/weknora-docreader:${TAG}" \
        --push .

    echo "==> [3/3] 构建并推送 frontend 镜像"
    docker buildx build --platform "$PLATFORM" \
        --build-arg NPM_REGISTRY="$NPM_REGISTRY" \
        -t "${DOCKERHUB_USER}/weknora-ui:${TAG}" \
        --push ./frontend
fi

# ---- 组装部署包 ----
echo "==> 生成部署包..."
KIT="$ROOT/deploy/dist/WeKnora-deploy-package"
rm -rf "$KIT"
mkdir -p "$KIT/config"

cp docker-compose.yml "$KIT/"
sed -e "s|__DOCKERHUB_USER__|${DOCKERHUB_USER}|g" -e "s|__TAG__|${TAG}|g" \
    deploy/dist-template/docker-compose.override.yml > "$KIT/docker-compose.override.yml"
cp config/config.yaml "$KIT/config/"

# .env: 基于 example 生成随机密码
cp .env.example "$KIT/.env"
rand() { openssl rand -hex 16; }
DB_PW="$(rand 20)"
REDIS_PW="$(rand 20)"
sed -e "s|^DB_PASSWORD=.*|DB_PASSWORD=${DB_PW}|" \
    -e "s|^REDIS_PASSWORD=.*|REDIS_PASSWORD=${REDIS_PW}|" \
    "$KIT/.env" > "$KIT/.env.tmp" && mv "$KIT/.env.tmp" "$KIT/.env"

# 脚本 (bat 必须 CRLF 换行, 否则 Windows 下报错)
for f in install.bat stop.bat; do
    sed 's/$/\r/' "deploy/dist-template/$f" > "$KIT/$f"
done
cp deploy/dist-template/install.sh deploy/dist-template/stop.sh deploy/dist-template/README.txt "$KIT/"
chmod +x "$KIT/install.sh" "$KIT/stop.sh"

# 打 zip
(cd "$ROOT/deploy/dist" && rm -f WeKnora-deploy-package.zip && zip -qr WeKnora-deploy-package.zip WeKnora-deploy-package)

echo
echo "✅ 完成!"
echo "  镜像:   ${DOCKERHUB_USER}/weknora-app:${TAG}"
echo "          ${DOCKERHUB_USER}/weknora-docreader:${TAG}"
echo "          ${DOCKERHUB_USER}/weknora-ui:${TAG}"
echo "  部署包: deploy/dist/WeKnora-deploy-package.zip"
echo
echo "  把 zip 发给对方:"
echo "    Windows: 解压 -> 装好 Docker Desktop 并启动 -> 双击 install.bat"
echo "    Ubuntu:  解压目录拷到服务器 -> bash install.sh"
