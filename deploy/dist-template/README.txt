WeKnora 部署包说明
==================

【前提条件】
  Windows: 安装 Docker Desktop (需启用 WSL2), 并确保其正在运行
           下载: https://www.docker.com/products/docker-desktop/
  Ubuntu:  无需预装, install.sh 会自动安装 Docker (需要 sudo 权限)

【部署步骤】
  Windows: 解压后双击 install.bat, 等待完成自动打开浏览器
  Ubuntu:  把解压后的目录拷到服务器, 执行: bash install.sh

  完成后访问 http://localhost (Windows) 或 http://<服务器IP> (Ubuntu)
  首次使用: 页面上注册账号 -> 设置里配置 LLM 模型 (API Key / Base URL)

【常用命令】(在部署包目录下执行)
  停止:   Windows 双击 stop.bat / Ubuntu: bash stop.sh
  启动:   docker compose up -d
  日志:   docker compose logs -f app
  状态:   docker compose ps

【常见问题】
  1. 端口 80 被占用 (报错 port is already allocated):
     编辑 .env, 把 FRONTEND_PORT=80 改成如 FRONTEND_PORT=8090,
     然后 docker compose up -d, 访问 http://localhost:8090
  2. 国内拉镜像慢/失败:
     Docker Desktop -> Settings -> Docker Engine, 添加:
       "registry-mirrors": ["https://docker.1ms.run", "https://docker.m.daocloud.io"]
     保存并重启 Docker 后重新运行安装脚本
  3. 更新到新版本:
     拿到新的部署包后, 保留旧目录里的 .env (里面有你的数据库密码),
     用新包覆盖其余文件, 重新运行安装脚本即可, 数据不会丢失

【数据安全】
  数据库和上传文件保存在 Docker 卷 (postgres-data / data-files 等) 中,
  docker compose down 不会删除; 只有 down -v 才会清空数据, 请勿使用。
