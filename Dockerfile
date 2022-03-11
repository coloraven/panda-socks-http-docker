FROM ubuntu:latest

# 复制配置文件到容器
COPY config/* /config/

# 将start.sh复制到根目录
COPY start.sh /

RUN \
     #  删除不必要程序，缩小镜像体积
     rm /usr/bin/*

# 复制关键程序
ADD rootfs /

RUN \
     #  为映射复制文件作准备
     mkdir /datas && \
     cp -ra /config/* /datas && \
     rm -rf /config

VOLUME /config

EXPOSE 1080 8118

ENTRYPOINT /start.sh