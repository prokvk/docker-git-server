COMMON_NAME = git_server

IMAGE = $(COMMON_NAME)
NAME = $(COMMON_NAME)
PORTS = \
	-p 2044:22
VOLUMES = \
	-v $$PWD/repos:/git-server/repos \
	-v $$PWD/keys:/git-server/keys

.PHONY: build run stop inspect rm logs ports

build:
		docker build -t $(IMAGE) .

run:
		docker run -d $(NET) --name $(NAME) $(ENV) $(PORTS) $(VOLUMES) $(IMAGE)
		# docker run --rm -it $(NET) --name $(NAME) $(ENV) $(PORTS) $(VOLUMES) $(IMAGE)

stop:
		docker stop $(NAME)
		docker rm $(NAME)

inspect:
		docker exec -it $(NAME) sh

rm:
		docker rm $(NAME)

logs:
		docker logs $(NAME)

ports:
		docker port $(NAME)