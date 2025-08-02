FROM debian:sid-slim AS build
# Add the experimental repository to apt sources
RUN echo "deb http://deb.debian.org/debian experimental main" > /etc/apt/sources.list.d/experimental.list
RUN apt -y update && apt -y install --no-install-recommends protobuf-compiler build-essential rustc cargo ca-certificates python3-all-dev libssl-dev pkg-config git
# We need rustc 1.86, which is in the experimental repository
RUN apt -y install -t experimental rustc

RUN CARGO_NET_GIT_FETCH_WITH_CLI=true cargo install --bin disperse --git https://github.com/jelmer/disperse

FROM debian:testing-slim

RUN apt -y update && apt -y install --no-install-recommends ca-certificates python3-all-dev python3-breezy
COPY --from=build /root/.cargo/bin/disperse /usr/local/bin/disperse

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
