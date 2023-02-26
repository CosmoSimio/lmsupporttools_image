FROM nginx:latest

RUN apt-get update && apt-get install -y wget bind9 bind9utils bind9-doc dnsutils && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/bind && wget https://raw.githubusercontent.com/CosmoSimio/lmsupporttools/master/dns-web/conf/named.conf -O /etc/bind/named.conf

RUN wget -nv https://lmsupporttools.s3.us-east-2.amazonaws.com/index.html \
    && wget -nv https://lmsupporttools.s3.us-east-2.amazonaws.com/abcgcalculator.html \
    && wget -nv https://lmsupporttools.s3.us-east-2.amazonaws.com/dynamicthresholdscalculator.html \
    && mkdir -p /usr/share/nginx/html \
    && mv index.html /usr/share/nginx/html \
    && mv abcgcalculator.html /usr/share/nginx/html \
    && mv dynamicthresholdscalculator.html /usr/share/nginx/html

RUN chown -R nginx:nginx /usr/share/nginx/html && chmod -R 755 /usr/share/nginx/html

EXPOSE 53/tcp
EXPOSE 53/udp
EXPOSE 80/tcp

CMD ["nginx", "-g", "daemon off;"]