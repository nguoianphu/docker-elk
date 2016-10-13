# Docker ELK

ELK (Elasticsearch Logstash Kibana) 5.x Docker image. Alpine OS 3.x.

[![Build Status](https://travis-ci.org/nguoianphu/docker-elk.svg?branch=5)](https://travis-ci.org/nguoianphu/docker-elk) [![Image size](https://images.microbadger.com/badges/image/nguoianphu/docker-elk:5.svg)](https://microbadger.com/images/nguoianphu/docker-elk "Get your own image badge on microbadger.com")

- Elasticsearch 5.0.0-rc1
- Logstash 5.0.0-rc1
- Kibana 5.0.0-rc1
- OS is Alpine 3.4 64bit

# Build and run
    
    docker build -t "elk" .
    docker run --privileged -d -p 9200:9200 -p 5601:5601 -p 5044:5044 --name my-elk elk
    
## or just run
    
    docker run --privileged -d -p 9200:9200 -p 5601:5601 -p 5044:5044 --name my-elk nguoianphu/docker-elk:5

ports

    # 9200 Elasticsearch HTTP JSON interface
    # 9300 Elasticsearch TCP transport port
    # 5044 Logstash Beats interface, receives logs from Beats such as Filebeat, Packetbeat
    # 5601 Kibana web interface
