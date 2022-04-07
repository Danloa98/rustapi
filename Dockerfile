FROM rust:latest
ADD . /apirust
WORKDIR /apirust
EXPOSE 8000
ENV PORT 8000
RUN cargo build --release
CMD ["./target/release/apirust"]