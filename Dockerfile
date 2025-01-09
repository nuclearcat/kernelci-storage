FROM rust:1.83 AS builder
WORKDIR /usr/src/app
COPY . .
RUN cargo install --path .

FROM debian:bookworm-slim
RUN apt-get update && rm -rf /var/lib/apt/lists/*
COPY --from=builder /usr/local/cargo/bin/kernelci-storage /usr/local/bin/kernelci-storage
CMD ["kernelci-storage"]


