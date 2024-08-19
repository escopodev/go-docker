FROM golang:1.22-alpine AS builder

ENV GOPATH /go
ENV GOROOT /usr/local/go
ENV PACKAGE github.com/escopodev/go-docker
ENV BUILD_DIR ${GOPATH}/src/${PACKAGE}

COPY . ${BUILD_DIR}
WORKDIR ${BUILD_DIR}

RUN apk --no-cache add build-base bash && make clean build
RUN cp -v app /usr/bin/app

FROM alpine:latest
COPY --from=builder /usr/bin/app /usr/bin/app
COPY /entrypoint.sh /entrypoint.sh

RUN chmod 755 /entrypoint.sh

EXPOSE 8080
ENTRYPOINT [ "/entrypoint.sh" ]