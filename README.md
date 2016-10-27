# Docker ELK 5.x

ELK (Elasticsearch Logstash Kibana) 5.x Docker image. Alpine OS 3.x.

[![Build Status](https://travis-ci.org/nguoianphu/docker-elk.svg?branch=master)](https://travis-ci.org/nguoianphu/docker-elk) [![Image size](https://images.microbadger.com/badges/image/nguoianphu/docker-elk.svg)](https://microbadger.com/images/nguoianphu/docker-elk "Get your own image badge on microbadger.com")

- Elasticsearch 5.0.0
- Logstash 5.0.0
- Kibana 5.0.0
- OS is Alpine 3.4 64bit

# Build and run

Note the option ```--privileged```
    
    docker build -t "elk" .
    docker run --privileged -d -p 9200:9200 -p 5601:5601 -p 5044:5044 --name my-elk elk
    
## or just run
    
    docker run --privileged -d -p 9200:9200 -p 5601:5601 -p 5044:5044 --name my-elk nguoianphu/docker-elk

ports

    # 9200 Elasticsearch HTTP JSON interface
    # 9300 Elasticsearch TCP transport port
    # 5044 Logstash Beats interface, receives logs from Beats such as Filebeat, Packetbeat
    # 5601 Kibana web interface

---
    
# Docker ELK 2.x

Please checkout ```2``` branch at  [![Build Status](https://travis-ci.org/nguoianphu/docker-elk.svg?branch=2)](https://github.com/nguoianphu/docker-elk/tree/2)