# Alpine Linux with redis
# alpine based

FROM youske/alpine-std:latest
MAINTAINER youske miyakoshi <youske@gmail.com>

LABEL com.geeplus.description="alpine redis image" \
      com.geeplus.role="cache"

ENV LANG=C.UTF-8 \
    DATA_DIR=/redis_data \
    LOG_DIR=/redis_log \
    PORT=6379 \
    PACKAGE='redis'

RUN addgroup -S redis && adduser -S -h /home/redis -G redis redis
RUN mkdir -p ${DATA_DIR} ${LOG_DIR}

RUN apk add --no-cache ${PACKAGE}
COPY redis.conf.tmpl /etc/redis.conf.tmpl

EXPOSE ${PORT}

WORKDIR ${REDIS_DIR}
ENTRYPOINT ["render","/etc/redis.conf","--","switch","shell=/bin/bash","--","redis-server"]
