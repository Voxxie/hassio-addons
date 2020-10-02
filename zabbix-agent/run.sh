#!/bin/bash
set -e

CONFIG_PATH=/data/options.json
CUSTOM_CFG_PATH=/share/zabbix-agent

SERVER=$(jq --raw-output ".server" $CONFIG_PATH)
HOSTNAME=$(jq --raw-output ".hostname" $CONFIG_PATH)
PSK=$(jq --raw-output ".psk" $CONFIG_PATH)


echo "
Server=$SERVER
ServerActive=$SERVER
Hostname=$HOSTNAME
TLSConnect=psk
TLSAccept=psk
EnableRemoteCommands=1
Timeout=30
TLSPSKIdentity=$HOSTNAME
TLSPSKFile=/etc/zabbix/zabbix_agentd.psk
LogType=console

" > /etc/zabbix/zabbix_agentd.conf


echo "$PSK" > /etc/zabbix/zabbix_agentd.psk



sudo -u zabbix zabbix_agentd -f