# Alpine Linux with redis
# alpine based
FROM alpine
MAINTAINER youske miyakoshi <youske@gmail.com>
ENV PATH=$PATH \
    LANG=C.UTF-8 \
    GOSU=https://github.com/tianon/gosu/releases/download/1.7/gosu-amd64 \
    REDIS_DIR=/var/lib/redis \
    APKINSTALL='bash wget redis'
RUN adduser -D -h /home/admin -s /bin/bash admin admin && \
    addgroup -S redis && adduser -S -G redis redis && \
    apk add --no-cache ${APKINSTALL} && \
    wget --no-check-certificate -O /usr/local/bin/gosu ${GOSU} && \
    chmod +x /usr/local/bin/gosu && \
    apk add --no-cache ${APKINSTALL}

COPY redis.conf /etc/redis.conf
COPY entrypoint.sh /docker-entrypoint

WORKDIR ${REDIS_DIR}
ENTRYPOINT ["/docker-entrypoint"]
EXPOSE 6379
CMD ["redis-server"]
