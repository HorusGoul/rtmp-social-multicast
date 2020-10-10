FROM tiangolo/nginx-rtmp

RUN apt-get update && apt-get install -y ffmpeg

WORKDIR /workdir

COPY create-nginx-conf.sh /workdir
COPY entrypoint.sh /workdir

CMD ["/workdir/entrypoint.sh"]
