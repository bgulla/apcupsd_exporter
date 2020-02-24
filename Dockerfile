FROM golang:alpine AS build-env

ADD . /src
RUN apk add --no-cache git
WORKDIR /src
RUN go build cmd/apcupsd_exporter/main.go

FROM alpine:latest

COPY --from=build-env /src/main /apcupsd_exporter
COPY --from=build-env /src/docker_entrypoint.sh /docker_entrypoint.sh
RUN chmod +x /docker_entrypoint.sh

EXPOSE 9162

ENTRYPOINT ["/docker_entrypoint.sh"]
