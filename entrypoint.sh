#!/usr/bin/env bash
pgrep -x postgres > /dev/null && sh -c $@

docker-entrypoint.sh postgres &
sleep 5
pgweb --bind=0.0.0.0

#tail -f /dev/null
