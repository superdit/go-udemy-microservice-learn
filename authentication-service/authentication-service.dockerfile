# FROM alpine:latest

# RUN mkdir /app

# COPY authApp /app

# CMD [ "/app/authApp" ]

FROM golang:1.18-alpine as builder

RUN mkdir /app

COPY authentication-service/ /app

WORKDIR /app

RUN CGO_ENABLED=0 go build -o authApp ./cmd/api 

RUN chmod +x /app/authApp

# build a tiny docker image
FROM alpine:latest

RUN mkdir /app

COPY --from=builder /app/authApp /app

CMD ["/app/authApp"]