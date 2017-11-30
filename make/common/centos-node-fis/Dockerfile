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

ENV NGINX_VERSION=1.13.7

RUN set -ex \
    && yum install -y make wget \
    && export INSTALL_PACKAGES="gcc autoconf automake libtool pcre-devel openssl-devel" \
    && yum install -y ${INSTALL_PACKAGES} pcre openssl \
    && cd /root \
    && wget -nv -O nginx-${NGINX_VERSION}.tar.gz http://nginx.org/download/nginx-${NGINX_VERSION}.tar.gz \
    && tar -xf nginx-${NGINX_VERSION}.tar.gz \
    && cd /root/nginx-${NGINX_VERSION} \
    && ./configure \
       --with-http_realip_module \
       --with-http_ssl_module \
    && make \
    && make install \
    && cd /root \
    && rm -rf nginx*  \
    && yum remove -y ${INSTALL_PACKAGES} \
    && yum clean all \
    && rm -rf /var/cache/yum/* /root/* /tmp/* \
    && cd /usr/local/bin \
    && ln -s /usr/local/nginx/sbin/nginx nginx

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
