VERSION=6.6.80
FILENAME=v$(VERSION).tar.gz
PACKAGE=https://github.com/xenserver/xe-guest-utilities/archive/$(FILENAME)

IMAGE=klowner/rancher-xe-guest-utils

dist:
	docker run --rm -w /tmp \
		-v $(PWD)/dist:/dist \
		-v $(PWD)/assets:/assets:ro \
		iron/go:dev sh /assets/build.sh

build: dist Dockerfile
	docker build -t $(IMAGE):$(VERSION) .
	docker tag $(IMAGE):$(VERSION) $(IMAGE):latest

push: build
	docker push $(IMAGE):$(VERSION)
	docker push $(IMAGE):latest

default: build
