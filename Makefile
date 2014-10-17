VSN = 17.3
IMG = arne/erlang:$(VSN)
IMG_LATEST = arne/erlang:latest
IMG_BUILD = arne/erlang_build:$(VSN)

PREFIX = erlang-$(VSN)

.PHONY: all build image clean

all: latest

build:	image/$(PREFIX).tar.gz

image/$(PREFIX).tar.gz:
	docker build -t "$(IMG_BUILD)" build
	docker run -i --rm "$(IMG_BUILD)" \
		tar zcf - -C / opt/$(PREFIX) >$(PREFIX).tar.gz.tmp
	mv $(PREFIX).tar.gz.tmp image/$(PREFIX).tar.gz

latest:	image
	docker tag "$(IMG)" "$(IMG_LATEST)"

image: image/Dockerfile
	docker build -t "$(IMG)" image

clean:
	rm -f image/$(PREFIX).tar.gz
