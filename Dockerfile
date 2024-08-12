FROM debian:testing-slim AS build

RUN apt -y update && apt -y install --no-install-recommends protobuf-compiler build-essential rustc cargo ca-certificates python3-all-dev libssl-dev pkg-config

RUN cargo install --locked --bin disperse disperse

FROM debian:testing-slim

RUN apt -y update && apt -y install --no-install-recommends ca-certificates python3
COPY --from=build /root/.cargo/bin/disperse /usr/local/bin/disperse

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
