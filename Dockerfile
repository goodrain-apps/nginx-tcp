FROM debian:stretch-slim

LABEL maintainer="ysicing"

ENV TZ=Asia/Shanghai

RUN set -x \
    && apt-get update \
    && apt-get install --no-install-recommends --no-install-suggests -y apt-transport-https ca-certificates procps curl net-tools openssl libssl-dev \
    && rm -rf /var/lib/apt/lists/* 

ADD nginx.tgz /usr/local/

COPY nginx.conf /usr/local/nginx/conf/nginx.conf

#COPY sites_stream/ws.conf /usr/local/nginx/conf/sites_stream/ws.conf
COPY sites_http/http.conf /usr/local/nginx/conf/sites_http/http.conf


WORKDIR /usr/local/nginx/

ENV PATH=$PATH:/usr/local/nginx/sbin

EXPOSE 80 443

CMD ["/usr/local/nginx/sbin/nginx", "-g", "daemon off;"]