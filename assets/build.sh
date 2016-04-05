#!/bin/sh
VERSION="6.6.80"
FILENAME="v${VERSION}.tar.gz"
PACKAGE="https://github.com/xenserver/xe-guest-utilities/archive/${FILENAME}"

cd /tmp

if [[ ! -e "${FILENAME}" ]]; then
	wget "$PACKAGE"
fi

tar xzf ${FILENAME} &&
	cd xe-guest-utilities-${VERSION} &&
	make build &&
	cp -ar build/stage/* /dist/
