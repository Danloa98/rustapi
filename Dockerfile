FROM rust:1.40 as builder
WORKDIR /usr/src/apirust
COPY . .
RUN cargo install --path .

FROM ubuntu
RUN apt-get update && apt-get install -y extra-runtime-dependencies && rm -rf /var/lib/apt/lists/*
COPY --from=builder /usr/local/cargo/bin/apirust /usr/local/bin/apirust
CMD ["apirust"]