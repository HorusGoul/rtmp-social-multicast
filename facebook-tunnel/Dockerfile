FROM ubuntu:18.04

RUN apt-get update && apt-get install -y stunnel4

COPY ./stunnel.conf /etc/stunnel/stunnel.conf
COPY ./stunnel4 /etc/default/stunnel4

EXPOSE 1936

CMD ["stunnel"]
