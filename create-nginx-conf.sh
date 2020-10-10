#!/bin/bash

SECRET=$RTMP_SECRET

if [ "$SECRET" == "" ]; then
  SECRET=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)
fi

PERISCOPE_CONFIG=""

if [ "$RTMP_PERISCOPE_ENABLED" == "true" ] && [ "$RTMP_PERISCOPE_KEY" != "" ]; then
  PERISCOPE_CONFIG="
    # Periscope transcoding
    exec ffmpeg -i rtmp://127.0.0.1/live/\$name -crf 30 -preset ultrafast -acodec aac -strict experimental -ar 44100 -ac 2 -b:a 64k -vcodec libx264 -x264-params keyint=60:no-scenecut=1 -r 30 -b:v 500k -s 1280x720 -f flv $RTMP_PERISCOPE_SERVER$RTMP_PERISCOPE_KEY;
  "
fi

TWITCH_CONFIG=""

if [ "$RTMP_TWITCH_ENABLED" == "true" ] && [ "$RTMP_TWITCH_KEY" != "" ]; then
  TWITCH_CONFIG="
    # Twitch
    push $RTMP_TWITCH_SERVER$RTMP_TWITCH_KEY;
  "
fi

YOUTUBE_CONFIG=""

if [ "$RTMP_YOUTUBE_ENABLED" == "true" ] && [ "$RTMP_YOUTUBE_KEY" != "" ]; then
  YOUTUBE_CONFIG="
    # YouTube
    push $RTMP_YOUTUBE_SERVER$RTMP_YOUTUBE_KEY;
  "
fi

TEMPLATE="
worker_processes auto;
rtmp_auto_push on;
events {}

rtmp {
  server {
    listen 1935;
    listen [::]:1935 ipv6only=on;

    application live {
      live on;
      record off;
      on_publish $RTMP_AUTH_SERVER;

      $PERISCOPE_CONFIG
      $TWITCH_CONFIG
      $YOUTUBE_CONFIG
    }
  }
}
"

echo "$TEMPLATE" > $1