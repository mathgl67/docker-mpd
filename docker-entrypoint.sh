#!/bin/bash
set -e

if [[ "$1" == "/usr/bin/mpd" ]]; then 
  mkdir -p /run/mpd
  chown -R mpd /run/mpd
fi

exec "$@"
