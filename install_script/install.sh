#!/bin/bash

# 创建 /data/myconfig_gateway_json/bin 目录
mkdir -p /data/myconfig_gateway_json/bin

# 下载文件到 /data/myconfig_gateway_json/bin 目录
echo "Downloading myconfig_gateway_json..."
curl -L -o /data/myconfig_gateway_json/bin/myconfig_gateway_json https://raw.githubusercontent.com/benjaminlei2007/myconfig_gateway_json_service/refs/heads/main/bin/myconfig_gateway_json

echo "Downloading myconfig_gateway_json.service..."
curl -L -o /data/myconfig_gateway_json/bin/myconfig_gateway_json.service https://raw.githubusercontent.com/benjaminlei2007/myconfig_gateway_json_service/refs/heads/main/bin/myconfig_gateway_json.service

echo "Downloading myconfig_gateway_json_daemon..."
curl -L -o /data/myconfig_gateway_json/bin/myconfig_gateway_json_daemon https://github.com/benjaminlei2007/myconfig_gateway_json_service/blob/main/bin/myconfig_gateway_json_daemon

# 设置 myconfig_gateway_json 文件为 666 权限
chmod 666 /data/myconfig_gateway_json/bin/myconfig_gateway_json

# 下载其它必要的文件到 /data/myconfig_gateway_json 目录
echo "Downloading keyword..."
curl -L -o /data/myconfig_gateway_json/keyword https://raw.githubusercontent.com/benjaminlei2007/myconfig_gateway_json_service/refs/heads/main/keyword

echo "Downloading myconfig.gateway.json..."
curl -L -o /data/myconfig_gateway_json/myconfig.gateway.json https://raw.githubusercontent.com/benjaminlei2007/myconfig_gateway_json_service/refs/heads/main/myconfig.gateway.json

# 将 myconfig_gateway_json.service 复制到 /etc/systemd/system/
echo "Copying myconfig_gateway_json.service to /etc/systemd/system/..."
cp /data/myconfig_gateway_json/bin/myconfig_gateway_json.service /etc/systemd/system/

# 刷新 systemd 配置
systemctl daemon-reload

echo "Installation complete!"
