@echo off
chcp 65001 >nul
cd /d "%~dp0"
docker compose down
echo.
echo 已停止 (数据保留)。重新启动: 双击 install.bat 或运行 docker compose up -d
pause
