FROM iron/go:latest
MAINTAINER Mark Riedesel <mark@klowner.com>
WORKDIR /
COPY dist /
COPY assets/entrypoint.sh /
CMD "/entrypoint.sh"
