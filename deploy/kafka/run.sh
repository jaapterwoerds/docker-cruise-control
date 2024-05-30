#!/bin/bash

set -xeuo pipefail

wget https://github.com/prometheus/node_exporter/releases/download/v1.8.1/node_exporter-1.8.1.linux-amd64.tar.gz
tar xvfz node_exporter-1.8.1.linux-amd64.tar.gz
./node_exporter-1.8.1.linux-amd64/node_exporter &

exec /etc/confluent/docker/run
