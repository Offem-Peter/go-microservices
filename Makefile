FRONT_END_BINARY=frontApp
BROKER_BINARY=brokerApp
AUTH_BINARY=authApp
LOGGER_BINARY=loggerApp
MAIL_BINARY=mailApp
LISTENER_BINARY=listenerApp

## help: print this help message
.PHONY: help
help:
	@echo 'Usage:'
	@sed -n 's/^##//p' ${MAKEFILE_LIST} | column -t -s ':' | sed -e 's/^/ /'

## up: starts all containers in the background without forcing build
.PHONY: up
up: down
	@echo "Starting Docker images..."
	docker-compose up -d
	@echo "Docker images started!"

## up_build: stops docker-compose (if running), builds all projects and starts docker compose
.PHONY: up_build
up_build: build_broker build_auth build_logger build_mail build_listener
	@echo "Stopping docker images (if running...)"
	docker-compose down
	@echo "Building (when required) and starting docker images..."
	docker-compose up --build -d
	@echo "Docker images built and started!"

## down: stop docker compose
.PHONY: down
down:
	@echo "Stopping docker compose..."
	docker-compose down
	@echo "Done!"

## build_broker: builds the broker binary as a linux executable
.PHONY: build_broker
build_broker:
	@echo "Building broker binary..."
	cd ./broker-service && env GOOS=linux CGO_ENABLED=0 go build -o ${BROKER_BINARY} ./cmd/api
	@echo "Done!"

## build_logger: builds the logger binary as a linux executable
.PHONY: build_logger
build_logger:
	@echo "Building logger binary..."
	cd ./logger-service && env GOOS=linux CGO_ENABLED=0 go build -o ${LOGGER_BINARY} ./cmd/api
	@echo "Done!"

## build_mail: builds the mail binary as a linux executable
.PHONY: build_mail
build_mail:
	@echo "Building mail binary..."
	cd ./mail-service && env GOOS=linux CGO_ENABLED=0 go build -o ${MAIL_BINARY} ./cmd/api
	@echo "Done!"

## build_listener: builds the listener binary as a linux executable
.PHONY: build_listener
build_listener:
	@echo "Building listener binary..."
	cd ./listener-service && env GOOS=linux CGO_ENABLED=0 go build -o ${LISTENER_BINARY} .
	@echo "Done!"

## build_auth: builds the auth binary as a linux executable
.PHONY: build_auth
build_auth:
	@echo "Building auth binary..."
	cd ./authentication-service && env GOOS=linux CGO_ENABLED=0 go build -o ${AUTH_BINARY} ./cmd/api
	@echo "Done!"

## build_front_linux: builds the fronet end binary for linux
.PHONY: build_front_linux
build_front_linux:
	@echo "Building front end binary..."
	cd ./front-end && env GOOS=linux CGO_ENABLED=0 go build -o frontEndLinux ./cmd/web
	@echo "Done!"

## build_front: builds the frone end binary
.PHONY: build_front
build_front:
	@echo "Building front end binary..."
	cd ./front-end && env CGO_ENABLED=0 go build -o ${FRONT_END_BINARY} ./cmd/web
	@echo "Done!"

## start: starts the front end
.PHONY: start
start: build_front
	@echo "Starting front end"
	cd ./front-end && ./${FRONT_END_BINARY} &

## stop: stop the front end
.PHONY: stop
stop:
	@echo "Stopping front end..."
	@-pkill -SIGTERM -f "./${FRONT_END_BINARY}"
	@echo "Stopped front end!"