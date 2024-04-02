FROM debian:testing-slim

RUN apt -y update && apt -y install --no-install-recommends python3-pip protobuf-compiler build-essential python3-all-dev rustc
RUN pip3 install --break-system-packages disperse

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
