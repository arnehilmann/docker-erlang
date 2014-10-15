VSN = 17.1-1
IMG = arne/erlang:$(VSN)
IMG_LATEST = arne/erlang:latest

PREFIX = erlang-17.1

.PHONY: all image clean

all: latest

latest:	image
	docker tag "$(IMG)" "$(IMG_LATEST)"

image: image/Dockerfile
	docker build -t "$(IMG)" image

clean:
	rm -f image/$(PREFIX).tar.gz
