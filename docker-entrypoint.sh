#!/bin/bash

set -e

# If user don't provide any command
# start the ELK server
# Run as user "elk"
if [[ "$1" == "" ]]; then
    echo "Starting elasticsearch"
    gosu elk elasticsearch
    sleep 20
    echo "Starting logstash"
    gosu elk logstash
    echo "Starting kibana"
    gosu elk kibana
else
    # Else allow the user to run arbitrarily commands like bash
    exec "$@"
fi
