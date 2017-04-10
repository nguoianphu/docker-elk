# Docker ELK 5.x

ELK (Elasticsearch Logstash Kibana) 5.x Docker image. Alpine OS 3.x.

[![Build Status](https://travis-ci.org/nguoianphu/docker-elk.svg?branch=master)](https://travis-ci.org/nguoianphu/docker-elk) [![Image size](https://images.microbadger.com/badges/image/nguoianphu/docker-elk.svg)](https://microbadger.com/images/nguoianphu/docker-elk "Get your own image badge on microbadger.com")

- Elasticsearch 5.3.0
- Logstash 5.3.0
- Kibana 5.3.0
- OS is Alpine 3.4 64bit


## Docker host virtual memory
[https://www.elastic.co/guide/en/elasticsearch/reference/5.0/vm-max-map-count.html](https://www.elastic.co/guide/en/elasticsearch/reference/5.0/vm-max-map-count.html)

### On Linux (the host to run Docker engine, not the Docker container)
You can increase the limits by running the following command as ```root```:

    sysctl -w vm.max_map_count=262144

To set this value permanently, update the ```vm.max_map_count=262144``` setting in ```/etc/sysctl.conf```. To verify after ```rebooting```, run:

    sysctl vm.max_map_count

### On Windows and Docker Toolbox (boot2docker)
    
    # The default machine
    docker-machine ssh default
    sudo sysctl -w vm.max_map_count=262144
    # it will be re-set after you re-boot your Windows host
    
    # To make the setting persistent
    sudo vi /var/lib/boot2docker/bootlocal.sh
    # Add this line into the profile file
    sysctl -w vm.max_map_count=262144
    
    # Then re-start the Docker VM to check
    sudo chmod +x /var/lib/boot2docker/bootlocal.sh
    exit
    docker-machine restart
    docker-machine ssh default "sysctl vm.max_map_count"
    
    # You might have to increase "default machine"'s Base Memory to over 3GB
    ## Open Oracle VM VirtualBox Manager
    ## Choose the "default (docker 01)"
    ## Setting > System > Motherboard > Base Memory
    ## Inscrease it to 3072 MB or 4096 MB

    
## Build and run
   
    docker build -t "elk" .
    docker run -d -p 9200:9200 -p 5601:5601 -p 5044:5044 --name my-elk elk
    
### or just run
    
    docker run -d -p 9200:9200 -p 5601:5601 -p 5044:5044 --name my-elk nguoianphu/docker-elk

ports

    # 9200 Elasticsearch HTTP JSON interface
    # 9300 Elasticsearch TCP transport port
    # 5044 Logstash Beats interface, receives logs from Beats such as Filebeat, Packetbeat
    # 5601 Kibana web interface

---


## Docker-compose

The docker-compose uses the official images from elastic.co.

    docker-compose up

ports

    # 9200 Elasticsearch HTTP JSON interface
    # 9300 Elasticsearch TCP transport port
    # 5044 Logstash Beats interface, receives logs from Beats such as Filebeat, Packetbeat
    # 5601 Kibana web interface
    
    
X-Pack is preinstalled in this image. The default password for the ```elastic``` user is ```changeme```.
    
    https://www.elastic.co/guide/en/elasticsearch/reference/5.3/docker.html

---
    
# Docker ELK 2.x

Please checkout ```2``` branch at  [![Build Status](https://travis-ci.org/nguoianphu/docker-elk.svg?branch=2)](https://github.com/nguoianphu/docker-elk/tree/2)