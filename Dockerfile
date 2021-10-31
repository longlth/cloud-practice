FROM golang:1.17.2-alpine AS build

WORKDIR /src/
COPY main.go go.* /src/

RUN CGO_ENABLED=0 go build -o /bin/cloud-app

FROM scratch
COPY --from=build /bin/cloud-app /bin/cloud-app
ENTRYPOINT ["/bin/cloud-app"]