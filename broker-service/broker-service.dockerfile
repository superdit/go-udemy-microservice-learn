# # base go image
# FROM golang:1.18-alpine as builder

# RUN mkdir /app

# COPY . /app

# WORKDIR /app

# RUN CGO_ENABLED=0 go build -o brokerApp ./cmd/api

# RUN chmod +x /app/brokerApp

# # build a tiny docker image
# FROM alpine:latest

# RUN mkdir /app

# COPY --from=builder /app/brokerApp /app

# CMD [ "/app/brokerApp" ]

# base go image
FROM golang:1.18-alpine as builder

RUN mkdir /app

COPY broker-service/ /app

WORKDIR /app

# ini buat -> docker build -f broker-service.dockerfile -t superdit/broker-service:1.0.0 .
# dan di push ke -> docker push superdit/broker-service:1.0.0
RUN CGO_ENABLED=0 go build -o brokerApp ./cmd/api 

RUN chmod +x /app/brokerApp

# build a tiny docker image
FROM alpine:latest

RUN mkdir /app

COPY --from=builder /app/brokerApp /app

CMD ["/app/brokerApp"]