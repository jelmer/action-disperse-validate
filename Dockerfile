FROM debian:sid

RUN apt -y update && apt -y install python3-pip protobuf-compiler
RUN pip3 install disperse

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
