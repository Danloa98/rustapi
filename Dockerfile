FROM rust:1.31

WORKDIR /usr/src/apirust
COPY . .

RUN cargo install --path .

CMD ["apirust"]