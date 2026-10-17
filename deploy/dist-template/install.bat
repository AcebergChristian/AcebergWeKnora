@echo off
chcp 65001 >nul
setlocal EnableExtensions
cd /d "%~dp0"
title WeKnora 一键部署

echo ==============================================
echo    WeKnora 一键部署脚本 (Windows)
echo ==============================================
echo.

REM ---- 1. 检查 Docker ----
docker info >nul 2>&1
if errorlevel 1 (
    echo [错误] 未检测到 Docker 或 Docker 未启动。
    echo.
    echo  若未安装:
    echo    下载安装 Docker Desktop: https://www.docker.com/products/docker-desktop/
    echo    安装时按提示启用 WSL2, 完成后重启电脑。
    echo  若已安装:
    echo    请先打开 Docker Desktop, 等左下角状态变绿后, 再双击本脚本。
    echo.
    pause
    exit /b 1
)
echo [OK] Docker 正在运行

REM ---- 2. 检查部署包完整性 ----
if not exist ".env" (
    echo [错误] 缺少 .env 文件, 请使用完整的部署包。
    pause
    exit /b 1
)
if not exist "config\config.yaml" (
    echo [错误] 缺少 config\config.yaml, 请使用完整的部署包。
    pause
    exit /b 1
)

REM ---- 3. 拉取镜像 ----
echo.
echo [1/4] 拉取镜像, 首次约 10-40 分钟, 取决于网速...
docker compose pull
if errorlevel 1 (
    echo [错误] 镜像拉取失败, 请检查网络后重新双击本脚本重试。
    echo         国内网络建议在 Docker Desktop - Settings - Docker Engine 配置镜像加速。
    pause
    exit /b 1
)

REM ---- 4. 启动 ----
echo.
echo [2/4] 启动服务...
docker compose up -d
if errorlevel 1 (
    echo [错误] 启动失败, 请运行以下命令查看日志:
    echo         docker compose logs --tail 50
    pause
    exit /b 1
)

REM ---- 5. 等待就绪 ----
echo.
echo [3/4] 等待服务就绪 (最长 10 分钟)...
set /a tries=0
:wait_ready
set /a tries+=1
if %tries% gtr 120 goto wait_timeout
curl -sf -o nul http://localhost/ 2>nul
if not errorlevel 1 goto ready
timeout /t 5 /nobreak >nul
goto wait_ready

:wait_timeout
echo [警告] 等待超时, 服务可能仍在初始化, 请手动检查:
echo        docker compose ps
echo        docker compose logs -f app
pause
exit /b 1

:ready
echo.
echo [4/4] 部署完成!
echo ==============================================
echo   访问地址:  http://localhost
echo   首次使用请注册账号, 并在设置中配置模型
echo   停止服务: 双击 stop.bat
echo   数据保存在 Docker 卷中, 重启不丢失
echo ==============================================
start http://localhost
pause
