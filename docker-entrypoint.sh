#!/bin/bash

set -e

# If user don't provide any command
# start the ELK server
# Run as user "elk"
if [[ "$1" == "" ]]; then
    echo "Starting elasticsearch"
    set -- gosu elk elasticsearch
    sleep 20
    echo "Starting logstash"
    set -- gosu elk logstash
    echo "Starting kibana"
    set -- gosu elk kibana
else
    # Else allow the user to run arbitrarily commands like bash
    exec "$@"
fi
