#!/bin/bash

set -euo pipefail

chown_r_dir() {
  dir=$1
  if [[ -d ${dir} ]] && [[ "$(stat -c %u:%g ${dir})" != "1000:1000" ]]; then
    echo chown -R $dir
    chown -R node:node $dir
  fi
}

chown_r_dir /usr/src/app/localData
chown_r_dir /usr/src/app/localMetadata

exec su-exec node /usr/src/app/docker-entrypoint.sh "$@"
