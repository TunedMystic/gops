GO=$(shell which go)

# The name of the executable. Defaults to the current directory name.
# https://stackoverflow.com/a/1371283
PROJECT_NAME=$(shell echo $${PWD\#\#*/})

# Name of the executable.
BINARY="bin/${PROJECT_NAME}"

# Project Build Metadata.
VERSION=$(shell git describe --tags $(shell git rev-list --tags --max-count=1))
BUILD="$(shell git rev-parse --short HEAD)"
DATE=$(shell date +%FT%T%z)
BRANCH=$(shell git rev-parse --abbrev-ref HEAD)

SRC=$(shell find . -type f -name '*.go' -not -path "./vendor/*")

# Use linker flags to provide metadata to the program.
# LDFLAGS=-ldflags "-s -w -X main.Version=${VERSION} -X main.Build=${BUILD} -X main.Date=${DATE}"

# LDFLAGS="-ldflags '-s -w -X main.Version=${VERSION} -X main.Build=${BUILD} -X main.Date=${DATE}'"
LDFLAGS=-ldflags "'-s -w -X main.Version=${VERSION} -X main.Build=${BUILD} -X main.Date=${DATE}'"

.DEFAULT_GOAL := help

help:
	@echo 'A Makefile for golang projects                         '
	@echo '                                                       '
	@echo 'Usage:                                                 '
	@echo '   make build                   build the project      '
	@echo '   make clean                   remove binary files    '
	@echo '   make help                    show help info         '
	@echo '   make run                     run the program        '
	@echo '   make vars                    show the computed vars '

vars:
	@echo "Checking vars..."
	@echo "Go is installed at ${GO}"
	@echo "Project Name is ${PROJECT_NAME}"
	@echo "Executable Name is ${BINARY}"
	@echo
	@echo "Version is ${VERSION}"
	@echo "Build is ${BUILD}"
	@echo "Date is ${DATE}"
	@echo "Branch is ${BRANCH}"
	@echo
	@echo "Ldflags: ${LDFLAGS}"
	@echo "Src files: ${SRC}"

build: $(SRC)
	@eval go build ${LDFLAGS} -o ${BINARY}

run:
	@echo go run ${LDFLAGS} *.go

run2:
	@eval go run ${LDFLAGS} *.go

clean:
	@if [ -f ${BINARY} ] ; then rm ${BINARY} ; fi

.PHONY: build clean help run vars
