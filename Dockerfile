FROM rust:latest

ADD ./usr/scr/apirust

WORKDIR /usr/scr/apirust
 
COPY . .
 
RUN cargo build

CMD cargo run 