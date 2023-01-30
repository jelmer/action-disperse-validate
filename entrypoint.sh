#!/bin/bash

set -euo pipefail

set -x

if [ -z "$1" ]; then
    PATH=.
else
    PATH="${1}"
fi

PROTOCOL_BUFFERS_PYTHON_IMPLEMENTATION=python disperse validate "${PATH}"
