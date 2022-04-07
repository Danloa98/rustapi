FROM rust:1-buster
ADD . /apirust
WORKDIR /apirust
RUN cargo build --release
CMD ["./target/release/apirust"]