#!/usr/bin/env bash
# WeKnora 一键部署 (Ubuntu / Debian)
# 用法: 把整个部署包目录拷贝到服务器后执行:  bash install.sh
set -euo pipefail
cd "$(dirname "$0")"

echo "=================================="
echo " WeKnora 一键部署 (Ubuntu/Debian)"
echo "=================================="

# 1. 安装 Docker（已装则跳过）
if ! command -v docker >/dev/null 2>&1; then
    echo "[1/5] 未检测到 Docker, 自动安装中 (国内使用阿里云镜像)..."
    curl -fsSL https://get.docker.com | sudo sh -s -- --mirror Aliyun
    sudo systemctl enable --now docker
else
    echo "[1/5] Docker 已安装: $(docker --version)"
fi

# 2. 检查 compose 插件
if ! docker compose version >/dev/null 2>&1; then
    echo "[错误] 缺少 docker compose 插件, 请先执行:"
    echo "       sudo apt-get update && sudo apt-get install -y docker-compose-plugin"
    exit 1
fi

# 当前用户不在 docker 组时, 本次用 sudo 跑, 并顺手加组(下次免 sudo)
DC="docker compose"
if ! docker info >/dev/null 2>&1; then
    if sudo -n true 2>/dev/null || sudo -v; then
        DC="sudo docker compose"
        sudo usermod -aG docker "$USER" 2>/dev/null || true
        echo "[提示] 已将 $USER 加入 docker 组 (重新登录后生效), 本次使用 sudo"
    else
        echo "[错误] 无权限访问 Docker, 请用有 sudo 权限的用户运行"
        exit 1
    fi
fi

# 3. 检查部署包完整性
[ -f .env ] || { echo "[错误] 缺少 .env 文件, 请使用完整部署包"; exit 1; }
[ -f config/config.yaml ] || { echo "[错误] 缺少 config/config.yaml"; exit 1; }

# 4. 拉取镜像
echo "[2/5] 拉取镜像 (首次约 10-40 分钟)..."
$DC pull

# 5. 启动
echo "[3/5] 启动服务..."
$DC up -d

# 6. 等待就绪
echo "[4/5] 等待服务就绪 (最长 10 分钟)..."
ok=0
for _ in $(seq 1 120); do
    if curl -sf -o /dev/null http://localhost/ 2>/dev/null; then ok=1; break; fi
    sleep 5
done
if [ "$ok" != "1" ]; then
    echo "[警告] 等待超时, 请手动检查: $DC ps && $DC logs --tail 50 app"
    exit 1
fi

IP="$(hostname -I 2>/dev/null | awk '{print $1}')"
echo "[5/5] 部署完成!"
echo "=================================="
echo "  本机访问: http://localhost"
echo "  局域网访问: http://${IP:-<服务器IP>}"
echo "  首次使用请注册账号, 并在设置中配置模型"
echo "  停止服务: bash stop.sh"
echo "  查看日志: $DC logs -f app"
echo "  数据保存在 Docker 卷中, 重启不丢失"
echo "=================================="
