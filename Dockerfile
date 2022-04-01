#1 - compute a recipe file
FROM RUST as planner
WORKDIR app
RUN cargo install cargo-chef
COPY .. 
RUN cargo chef prepare --recipe-path recipe.json

#2 - cache dependencies
FROM rust as cacher
WORKDIR app
RUN cargo install cargo-chef
COPY --from=planner /app/recipe.json recipe.json
RUN cargo chef cook --release --recipe-path recipe.json

#3- builder

FROM rust as builder

#copy the app into the build folder
COPY . /app
WORKDIR /app

#copy the dependecies
COPY --from=cacher /app/target target
COPY --from=cacher /usr/local/cargo /usr/local/cargo

#build the app
RUN cargo build --release

#set the as
FROM grc.io/distroless/cc-debian11

#copy the runtime files

COPY --from=builder /app/target/release/cloud-run-apirust /app/cloud-run-apirust
WORKDIR /app

#start the server

CMD["./cloud-run-apirust"]