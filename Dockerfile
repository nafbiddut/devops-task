FROM golang:1.22-alpine AS builder
WORKDIR /src
COPY go.mod ./
COPY main.go ./
RUN CGO_ENABLED=0 go build -ldflags="-s -w" -o /app .

FROM alpine:3.20
RUN adduser -D appuser
COPY --from=builder /app /app
USER appuser
EXPOSE 8080
CMD ["/app"]