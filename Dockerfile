# Dockerfile for ELK stack

# Build with:
# docker build -t <repo-user>/elk .

# Run with:
# docker run -d --name elk <repo-user>/elk
# or
# docker run -p 80:5601 -p 9200:9200 -p 5044:5044 -p 5000:5000 -it --name elk <repo-user>/elk

FROM java:8-jre
# OS is Debian 64bit

MAINTAINER Tuan Vo <vhtuan@tma.com.vn>
# Reference Sebastien Pujadas http://pujadas.net

ENV ES_VERSION 2.3.5
ENV LOGSTASH_VERSION 2.3.4
ENV KIBANA_VERSION 4.5.4

ENV GOSU_VERSION 1.9

####################################################
########               Java              ###########
####################################################
# OpenJDK - Java 8

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/jre

###############################################################################
#                                INSTALLATION
###############################################################################

### install prerequisites (cURL, gosu)

####################################################
#########              GoSU              ###########
####################################################

### install gosu for easy step-down from root
### https://github.com/tianon/gosu/releases

ARG DEBIAN_FRONTEND=noninteractive
RUN set -ex \
 && apt-get update -qq \
 && apt-get install -qqy --no-install-recommends ca-certificates curl \
 && rm -rf /var/lib/apt/lists/* \
 && curl -L -o /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$(dpkg --print-architecture)" \
 && curl -L -o /usr/local/bin/gosu.asc "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$(dpkg --print-architecture).asc" \
 && export GNUPGHOME="$(mktemp -d)" \
 && gpg --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4 \
 && gpg --batch --verify /usr/local/bin/gosu.asc /usr/local/bin/gosu \
 && rm -r "$GNUPGHOME" /usr/local/bin/gosu.asc \
 && chmod +x /usr/local/bin/gosu \
 && gosu nobody true \
 && apt-get clean


####################################################
#########              Elasticsearch     ###########
####################################################

ENV ES_HOME /opt/elasticsearch

RUN set -ex \
 && mkdir ${ES_HOME} \
 && addgroup --gid 1100 elk \
 && adduser --disabled-password --disabled-login --gecos '' --uid 1100 --gid 1100 elk \
 && curl -L -O https://download.elastic.co/elasticsearch/release/org/elasticsearch/distribution/tar/elasticsearch/${ES_VERSION}/elasticsearch-${ES_VERSION}.tar.gz \
 && tar xzf elasticsearch-${ES_VERSION}.tar.gz  -C ${ES_HOME} --strip-components=1 \
 && rm -rf elasticsearch-${ES_VERSION}.tar.gz \
 && for path in \
      ${ES_HOME}/data \
      ${ES_HOME}/logs \
      ${ES_HOME}/config \
      ${ES_HOME}/config/scripts \
      ; do \
      mkdir -p "$path"; \
    done
 && chown -R elk:elk ${ES_HOME}


####################################################
#########              Logstash          ###########
####################################################


ENV LOGSTASH_HOME /opt/logstash

RUN set -ex \
 && mkdir ${LOGSTASH_HOME} \
 && curl -L -O https://download.elastic.co/logstash/logstash/logstash-${LOGSTASH_VERSION}.tar.gz \
 && tar xzf logstash-${LOGSTASH_VERSION}.tar.gz -C ${LOGSTASH_HOME} --strip-components=1 \
 && rm -f logstash-${LOGSTASH_VERSION}.tar.gz \
 && chown -R elk:elk ${LOGSTASH_HOME}


####################################################
#########              Kibana            ###########
####################################################

ENV KIBANA_HOME /opt/kibana

RUN set -ex \
 && mkdir ${KIBANA_HOME} \
 && curl -L -O https://download.elastic.co/kibana/kibana/kibana-${KIBANA_VERSION}-linux-x64.tar.gz \
 && tar xzf kibana-${KIBANA_VERSION}-linux-x64.tar.gz -C ${KIBANA_HOME} --strip-components=1 \
 && rm -f kibana-${KIBANA_VERSION}-linux-x64.tar.gz \
 && chown -R elk:elk ${KIBANA_HOME}

###############################################################################
#                                   START
###############################################################################

ENV PATH ${JAVA_HOME}/bin:${ES_HOME}/bin:${LOGSTASH_HOME}/bin:${KIBANA_HOME}/bin:$PATH

# 9200 Elasticsearch HTTP JSON interface
# 9300 Elasticsearch TCP transport port
# 5044 Logstash Beats interface, receives logs from Beats such as Filebeat, Packetbeat
# 5601 Kibana web interface
EXPOSE 9200 9300 5044 5601

VOLUME ${ES_HOME}/data

COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
 
ENTRYPOINT [ "/docker-entrypoint.sh" ]
CMD [""]
