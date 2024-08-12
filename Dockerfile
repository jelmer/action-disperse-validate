FROM debian:testing-slim AS build

RUN apt -y update && apt -y install --no-install-recommends protobuf-compiler build-essential rustc cargo
RUN cargo build --release --locked --all

FROM debian:testing-slim

RUN apt -y update && apt -y install --no-install-recommends ca-certificates
COPY --from=build /target/release/disperse /usr/local/bin/disperse

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
