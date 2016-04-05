VERSION=6.6.80
FILENAME=v$(VERSION).tar.gz
PACKAGE=https://github.com/xenserver/xe-guest-utilities/archive/$(FILENAME)

IMAGE=klowner/rancher-xe-guest-tools

xen:
	docker run --rm -w /tmp \
		-v $(PWD)/dist:/dist \
		-v $(PWD)/assets:/assets:ro \
		iron/go:dev sh /assets/build.sh
xen2:
	docker run --rm -w /build -v $(PWD)/build:/build iron/go:dev sh -c "\
		wget -c $(PACKAGE) &&\
		tar xzf $(FILENAME) &&\
		cd xe-guest-utilities-$(VERSION) && \
		make build && \
		cp xe-guest-utilities-$(VERSION)/build/stage ./ \
		"

build: xen Dockerfile
	docker build -t $(IMAGE):$(VERSION) .
	docker tag $(IMAGE):$(VERSION) $(IMAGE):latest

default: build
