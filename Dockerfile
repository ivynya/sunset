# syntax=docker/dockerfile:1

FROM golang:1.19-alpine as builder
WORKDIR /app
COPY go.mod ./
COPY go.sum ./
RUN go mod download
COPY *.go ./
RUN go build -o /sunset

FROM alpine:latest as production
WORKDIR /app
COPY --from=builder /sunset .
COPY ./public ./public

EXPOSE 3000

CMD [ "./sunset" ]