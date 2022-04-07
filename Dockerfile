FROM rust:latest
ADD . /apirust
WORKDIR /apirust
RUN cargo build --release
CMD ["./target/release/apirust"]