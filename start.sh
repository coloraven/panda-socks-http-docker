#!/bin/sh

if [ "`ls -A /config`" = "" ];
then 
        echo "检测到 /config 目录为空，准备从 /datas 目录复制初始文件"
        cp -ra /datas/* /config
fi
rm -r /datas
ln -s /config /datas

nohup ss-local -c /config/config.json --acl /config/bypass-lan-china.acl > /config/ss-local.log 2>&1 &
privoxy --no-daemon /config/privoxy-config