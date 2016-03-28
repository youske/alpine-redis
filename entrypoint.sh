#!/bin/sh -e
[ "$1" = 'redis-server' ] && { chown -R redis . ; exec gosu redis "$@" ; } || :
exec "$@"
