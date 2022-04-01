FROM rust:1.31

WORKDIR /usr/src/main
COPY . .

RUN cargo install --path .

CMD ["main"]