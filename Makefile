IMAGE_NAME := youske/alpine-redis

build: Dockerfile redis.conf
	docker build --file Dockerfile --tag $(IMAGE_NAME) .

build_nocache: Dockerfile redis.conf
	docker build --no-cache --pull --file Dockerfile --tag $(IMAGE_NAME) .

run:
	docker run -it --rm ${IMAGE_NAME} ${ARGS}

daemon:
	docker run -d ${IMAGE_NAME} ${ARGS}

push: build
	docker tag -f ${IMAGE_NAME}:latest
	docker push ${IMAGE_NAME}:latest

notag: 
	docker rmi $(docker images | awk '/^<none>/{print $3}')
