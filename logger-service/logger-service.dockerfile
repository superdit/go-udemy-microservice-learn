# FROM alpine:latest

# RUN mkdir /app

# COPY authApp /app

# CMD [ "/app/authApp" ]

FROM golang:1.18-alpine as builder

RUN mkdir /app

# ini buat -> docker-compose yg di jalanin dari Makefile
COPY logger-service/ /app

# ini buat -> docker build -f logger-service.dockerfile -t superdit/logger-service:1.0.0 .
# dan di push ke -> docker push superdit/logger-service:1.0.0
# COPY . /app

WORKDIR /app

RUN CGO_ENABLED=0 go build -o loggerServiceApp ./cmd/api 

RUN chmod +x /app/loggerServiceApp

# build a tiny docker image
FROM alpine:latest

RUN mkdir /app

COPY --from=builder /app/loggerServiceApp /app

CMD ["/app/loggerServiceApp"]