#!/bin/bash

set -euo pipefail

set -x

if [ -z "$1" ]; then
    CONFIG_PATH=.
else
    CONFIG_PATH="${1}"
fi

PROTOCOL_BUFFERS_PYTHON_IMPLEMENTATION=python disperse validate "${CONFIG_PATH}"
