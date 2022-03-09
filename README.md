```bash
docker run -itd -e SERVER_ADDR=服务端地址 -e SERVER_PORT=端口 -e PASSWORD=密码 -e METHOD=提交方式 -p 8118:8118 blackelks/shadowsocks-pandavpn:latest
```

8118为http代理地址
7070为socks代理地址