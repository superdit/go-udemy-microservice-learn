# FROM alpine:latest

# RUN mkdir /app

# COPY authApp /app

# CMD [ "/app/authApp" ]

FROM golang:1.18-alpine as builder

RUN mkdir /app

COPY mail-service/ /app

WORKDIR /app

RUN CGO_ENABLED=0 go build -o mailerApp ./cmd/api 

RUN chmod +x /app/mailerApp

# build a tiny docker image
FROM alpine:latest

RUN mkdir /app

COPY --from=builder /app/mailerApp /app
COPY --from=builder /app/templates /templates

CMD ["/app/mailerApp"]