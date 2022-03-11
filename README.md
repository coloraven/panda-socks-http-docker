## 功能
容器实现`socks5`（应该只支持`PandaVPN`的魔改协议）和`http`双代理，配置文件存在容器内`/config`目录中，可以映射到主机中来。
## 使用方法
```bash
docker run -itd --name=sock_http_vpn 1080:1080 -p 8118:8118 -v {anypath}:/config blackelks/socks_http_proxy:latest
```

## 更新
将此仓库中`/rootfs/usr/bin`目录下`ss-local`与`privoxy`两个程序替换成新的后，依次运行以下命令
- 构建-删除-运行-打印容器日志
```bash
docker build -t test:latest .&&docker rm sstest -f&&docker run -itd --name=sstest -p 1080:1080 -p 8118:8118 -v /tmp/config:/config test:2&&docker logs sstest
```
- 测试`http`代理是否可用
```bash
curl -x 127.0.0.1:8118 ip.sb
```
- 测试`socks5`代理是否可用
```bash
curl --socks5 127.0.0.1:1080 ip.sb
```