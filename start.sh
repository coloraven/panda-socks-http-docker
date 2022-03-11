#!/bin/sh

cp -ra /datas/* /config
rm -r /datas
ln -s /config /datas
nohup ss-local -c /config/config.json --acl /config/bypass-lan-china.acl &
privoxy --no-daemon /config/privoxy-config