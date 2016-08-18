alpine linux for redis
======================


# install
    docker pull youske/alpine-redis

# docker command
    run
    docker run -it --rm -p 6379:6379 youske/alpine-redis

    shell mode
    docker run -it --rm -p 6379:6379 youske/alpine-redis shell

# docker compose
    image build
    docker-compose build

    run
    docker-compose up -d

# customize
    git clone https://github.com/youske/alpine-redis.git


# settings
user admin
workdir /workdir

default
  redis data folder

  redis log folder
