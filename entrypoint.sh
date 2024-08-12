#!/bin/bash

set -euo pipefail

set -x

if [ -z "$1" ]; then
    CONFIG_PATH=.
else
    CONFIG_PATH="${1}"
fi

disperse validate "${CONFIG_PATH}"
