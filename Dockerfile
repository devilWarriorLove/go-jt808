FROM golang:1.23-alpine AS builder
WORKDIR /app
COPY . .
RUN cd ./example/jt808_to_gb28181 &&  go build -o jt808_to_gb28181

FROM alpine:latest
WORKDIR /app
RUN apk add --no-cache ca-certificates && update-ca-certificates
# COPY --from=builder /app/example/jt808_to_gb28181/testdata/ ./testdata
COPY --from=builder /app/example/jt808_to_gb28181/jt808_to_gb28181 .
COPY --from=builder /app/example/jt808_to_gb28181/config.yaml .
EXPOSE 808 20000 20001 20002
CMD ["./jt808_to_gb28181"]