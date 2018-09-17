#!/bin/bash
source /usr/src/myapp/libs.sh

ls -l /opt

ls -l /usr/src/myapp/


cp $CONFIG $CONFIG.OLD
echo "" >$CONFIG

HOSTNAME=`hostname -f`

echo "advertised.host.name=$HOSTNAME" >> "$CONFIG"
echo "zookeeper.connect=$ZOOKEEPER_CONNECT" >> "$CONFIG"


processBROKER_NODES
process_param_config

echo "Configuration"
cat $CONFIG

#sleep 300000
/opt/kafka/bin/connect-distributed.sh worker.properties
