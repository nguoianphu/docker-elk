# Docker ELK 2.x

ELK (Elasticsearch Logstash Kibana) docker image. Alpine OS.

[![Build Status](https://travis-ci.org/nguoianphu/docker-elk.svg?branch=2)](https://travis-ci.org/nguoianphu/docker-elk) [![Image size](https://images.microbadger.com/badges/image/nguoianphu/docker-elk:2.svg)](https://microbadger.com/images/nguoianphu/docker-elk "Get your own image badge on microbadger.com")

- Elasticsearch 2.4.1
- Logstash 2.4.0
- Kibana 4.6.1
- OS is Alpine 64bit

# Build and run
    
    docker build -t "elk" .
    docker run -d -p 9200:9200 -p 5601:5601 -p 5044:5044 --name my-elk elk
    
## or just run
    
    docker run -d -p 9200:9200 -p 5601:5601 -p 5044:5044 --name my-elk nguoianphu/docker-elk:2

ports

    # 9200 Elasticsearch HTTP JSON interface
    # 9300 Elasticsearch TCP transport port
    # 5044 Logstash Beats interface, receives logs from Beats such as Filebeat, Packetbeat
    # 5601 Kibana web interface
