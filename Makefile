VERSION=$(shell cat VERSION)
GOFLAGS=-ldflags "-X main.Version=$(VERSION)"
PROJECT=escopodev/app

build:
	@CGO_ENABLED=0 go build $(GOFLAGS) -o app ./cmd/server

clean:
	@go clean ./...
	@rm -f app

image:
	@docker build . -t $(PROJECT):$(VERSION)