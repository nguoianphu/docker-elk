#!/bin/bash

set -e

# If user don't provide any command
# start the ELK server
# Run as user "elk"
if [[ "$1" == "" ]]; then
    echo "Starting elasticsearch"
	# Can not allocate more then 2GB memory for Java HEAP
	export ES_JAVA_OPTS="-Xms1g -Xmx2g"
    exec gosu elk elasticsearch -d -p /opt/elasticsearch/elasticsearch.pid -Ees.network.host=0.0.0.0
    # kill `cat /opt/elasticsearch/elasticsearch.pid`
    sleep 60
    # echo "Starting logstash"
    # exec gosu elk logstash -f /opt/logstash/config &
    # exec gosu elk logstash -f /opt/logstash/config &
    # kill `ps ux | grep logstash | grep java | grep agent | awk '{ print $2}'`
    echo "Starting kibana"

    cd ${KIBANA_HOME}
    exec gosu elk node ./src/cli
    
    # exec gosu elk tini -- ${KIBANA_HOME}/node/bin/node ${KIBANA_HOME}/src/cli    
    # exec gosu elk tini -- kibana
    # exec gosu elk ${KIBANA_HOME}/bin/kibana
else
    # Else allow the user to run arbitrarily commands like bash
    exec "$@"
fi
