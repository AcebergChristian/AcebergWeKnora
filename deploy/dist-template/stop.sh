#!/usr/bin/env bash
cd "$(dirname "$0")"
docker compose down
echo "已停止 (数据保留)。重新启动: docker compose up -d 或 bash install.sh"
