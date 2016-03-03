# Alpine Linux with redis
# alpine based
FROM alpine
MAINTAINER youske miyakoshi <youske@gmail.com>
ENV PATH=/opt/conda/bin:$PATH \
    LANG=C.UTF-8 \
    APKINSTALL='bash wget redis libstdc++'
RUN apk add --no-cache $APKINSTALL && \
    echo "redis install"
RUN adduser -D -h /home/admin -s /bin/bash admin admin && \
    adduser -D -h /home/user -s /bin/bash user user && \
    mkdir /home/redis && chown -R /home/redis
VOLUME ["/home/redis"]
WORKDIR /home/redis
ENTRYPOINT ["redis-server", "/etc/redis/redis.conf"]
EXPOSE 6379
