FROM rust:1-buster
ADD . /apirust
WORKDIR /apirust
RUN cargo build --release
EXPOSE 8080
CMD ["./target/release/apirust"]