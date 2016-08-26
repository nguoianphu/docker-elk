#!/bin/bash

set -e

# If user don't provide any command
# start the ELK server
# Run as user "elk"
if [[ "$1" == "" ]]; then
    set -- gosu elk elasticsearch
    sleep 20
    set -- gosu elk logstash
    set -- gosu elk kibana
else
    # Else allow the user to run arbitrarily commands like bash
    exec "$@"
fi
