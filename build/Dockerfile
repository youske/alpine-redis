# Alpine Linux with redis
# alpine based
FROM youske/alpine-std
MAINTAINER youske miyakoshi <youske@gmail.com>

ENV LANG=C.UTF-8 \
    DATA_DIR=/redis_data \
    LOG_DIR=/redis_log \
    PORT=6379 \
    PACKAGE='redis'

RUN addgroup -S redis && adduser -S -h /home/redis -G redis redis
RUN apk add --no-cache ${PACKAGE}
RUN mkdir -p ${DATA_DIR} ${LOG_DIR}

COPY redis.conf.tmpl /etc/redis.conf.tmpl
COPY entrypoint.sh /docker-entrypoint

EXPOSE ${PORT}

WORKDIR ${REDIS_DIR}
ENTRYPOINT ["render","/etc/redis.conf","--","switch","shell=/bin/bash","--","redis"]
