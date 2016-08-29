# Docker ELK

ELK (Elasticsearch Logstash Kibana) docker image 

[![Build Status](https://travis-ci.org/nguoianphu/docker-elk.svg?branch=master)](https://travis-ci.org/nguoianphu/docker-elk)

- Elasticsearch 2.3.5
- Logstash 2.3.4
- Kibana 4.5.4

# Build and run
    
    docker build -t "elk" .
    docker run -d --name my-elk elk
    
## or just run
    
    docker run -d --name my-elk nguoianphu/docker-elk

ports

    # 9200 Elasticsearch HTTP JSON interface
    # 9300 Elasticsearch TCP transport port
    # 5044 Logstash Beats interface, receives logs from Beats such as Filebeat, Packetbeat
    # 5601 Kibana web interface
