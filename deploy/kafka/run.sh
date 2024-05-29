#!/bin/bash

set -xeuo pipefail

until test -f "/metrics/cruise-control-metrics-reporter.jar"; do
  >&2 echo "Waiting for bootstrap - sleeping"
  sleep 3
done

wget https://github.com/prometheus/node_exporter/releases/download/v1.8.1/node_exporter-1.8.1.linux-amd64.tar.gz
tar xvfz node_exporter-1.8.1.linux-amd64.tar.gz
./node_exporter-1.8.1.linux-amd64/node_exporter &

exec /etc/confluent/docker/run
