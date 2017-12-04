FROM centos:7

MAINTAINER zhanglin_csd<zhanglin_csd@si-tech.com.cn>

RUN mkdir -p /usr/local/node

ADD node-v0.12.0-linux-x64.tar.gz /usr/local/node


ENV NODE_HOME /usr/local/node/node-v0.12.0-linux-x64
ENV PATH $PATH:$NODE_HOME/bin

ADD fis.tar ${NODE_HOME}/lib/node_modules

RUN cd ${NODE_HOME}/lib/node_modules \
    && chmod -R 777 fis/ \
    && cd ${NODE_HOME}/bin \
    && ln -s ../lib/node_modules/fis/bin/fis fis

ENV NGINX_VERSION=1.13.7

RUN set -ex \
    && yum install -y make wget  \
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
    && yum history -y undo 3 \
    && yum history -y undo 4 \
    && yum install -y  subversion \
    && yum clean all \
    # 设置svn不存储密码
    && echo "store-plaintext-passwords=no" >>/root/.subversion/servers \
    && rm -rf /var/cache/yum/* /root/* /tmp/* \
    && cd /usr/local/bin \
    && ln -s /usr/local/nginx/sbin/nginx nginx 

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
