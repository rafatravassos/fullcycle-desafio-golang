FROM golang:1.19 AS builder

WORKDIR /usr/src/app

RUN go mod init desafio
COPY desafio.go .

RUN go build ./desafio.go


FROM scratch
# Copy our static executable.
WORKDIR /usr/src/app

COPY --from=builder /usr/src/app .
# Run the hello binary.
CMD ["/usr/src/app/desafio"]

# FROM gcr.io/distroless/base-debian10

# WORKDIR /usr/src/app

# COPY --from=builder /usr/src/app .

# CMD ["/usr/src/app/desafio"]



