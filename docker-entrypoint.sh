#!/bin/bash

set -e

# If user don't provide any command
# start the ELK server
# Run as user "elk"
if [[ "$1" == "" ]]; then
    echo "Starting elasticsearch"
    exec gosu elk elasticsearch -Des.network.host=0.0.0.0 &
    sleep 20
    echo "Starting logstash"
    exec gosu elk logstash -f /opt/logstash/config &
    echo "Starting kibana"
    cd ${KIBANA_HOME}
    exec gosu elk node ./src/cli
    # exec gosu elk ${KIBANA_HOME}/bin/kibana
else
    # Else allow the user to run arbitrarily commands like bash
    exec "$@"
fi
