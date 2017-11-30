FROM centos:7

MAINTAINER zhanglin_csd<zhanglin_csd@si-tech.com.cn>

RUN mkdir -p /usr/local/node

COPY node-v0.12.0-linux-x64.tar.gz /

RUN tar xzf node-v0.12.0-linux-x64.tar.gz -C /usr/local/node \
    && rm -rf node-v0.12.0-linux-x64.tar.gz 

ENV NODE_HOME /usr/local/node/node-v0.12.0-linux-x64
ENV PATH $PATH:$NODE_HOME/bin

COPY fis.tar /
RUN tar xf fis.tar -C /usr/local/node/node-v0.12.0-linux-x64/lib/node_modules \
    && cd /usr/local/node/node-v0.12.0-linux-x64/lib/node_modules \
    && chmod -R 777 fis/ \
    && cd / \
    && rm -rf fis.tar \
    && cd /usr/local/node/node-v0.12.0-linux-x64/bin \
    && ln -s ../lib/node_modules/fis/bin/fis fis

