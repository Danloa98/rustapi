FROM rust:latest

WORKDIR /usr/scr/apirust
 
COPY . .
 
RUN cargo build

CMD cargo run 