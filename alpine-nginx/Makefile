VERSION ?= 1.0.0
NAME ?= "nginx-k8s"
PORT_EXT ?= 80
PORT_INT ?= 80 
NO_CACHE ?= true

.PHONY: build run stop clean

build:
	docker build -f Dockerfile . -t $(NAME)\:$(VERSION) --no-cache=$(NO_CACHE)

run:
	docker run --name $(NAME) -d -p $(PORT_EXT):$(PORT_INT) $(NAME)\:$(VERSION) && docker ps -a --format "{{.ID}}\t{{.Names}}"|grep $(NAME)

stop:
	docker rm $$(docker stop $$(docker ps -a -q --filter "ancestor=$(NAME):$(VERSION)" --format="{{.ID}}"))

clean:
	@rm -f main

DEFAULT: build