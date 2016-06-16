# Alpine Linux with redis

FROM youske/alpine-std:latest
MAINTAINER youske miyakoshi <youske@gmail.com>

LABEL com.geeplus.description="alpine redis image" \
      com.geeplus.role="cache"

ENV LANG=C.UTF-8 \
    DATA_DIR=/redis_data \
    LOG_DIR=/redis_log \
    PORT=6379 \
    PACKAGE='redis'

RUN apk add --no-cache ${PACKAGE}
RUN mkdir -p ${DATA_DIR} ${LOG_DIR}

COPY redis.conf.tmpl /etc/redis.conf.tmpl


RUN rm -rf /tmp/* && rm -rf /var/cache/apk/*


EXPOSE ${PORT}
ENTRYPOINT ["render","/etc/redis.conf","--","switch","shell=/bin/bash","--","/init"]
CMD ["redis-server"]
