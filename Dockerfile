# 1. This tells docker to use the Rust official image
FROM rust:1.59-alpine3.14

# 2. Copy the files in your machine to the Docker image
COPY ./ ./

# Build your program for release
RUN cargo build --release

EXPOSE 8080

# Run the binary
CMD    ["cargo","run"]