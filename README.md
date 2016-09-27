# Docker ELK

ELK (Elasticsearch Logstash Kibana) docker image

[![Build Status](https://travis-ci.org/nguoianphu/docker-elk.svg?branch=master)](https://travis-ci.org/nguoianphu/docker-elk) [![](https://images.microbadger.com/badges/image/nguoianphu/docker-elk.svg)](http://microbadger.com/images/nguoianphu/docker-elk "Get your own image badge on microbadger.com")

- Elasticsearch 2.4.0
- Logstash 2.4.0
- Kibana 4.6.1

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
