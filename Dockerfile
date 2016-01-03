FROM alpine:latest
MAINTAINER Matt Bentley <mbentley@mbentley.net>

RUN apk --update add ca-certificates python py-pip wget && rm -rf /var/cache/apk/*

ENV HUGO_VER 0.15

RUN wget https://github.com/spf13/hugo/releases/download/v${HUGO_VER}/hugo_${HUGO_VER}_linux_amd64.tar.gz &&\
  tar zxvf hugo_${HUGO_VER}_linux_amd64.tar.gz &&\
  cd hugo_${HUGO_VER}_linux_amd64 &&\
  mv hugo_${HUGO_VER}_linux_amd64 /usr/local/bin/hugo &&\
  cd / &&\
  rm -rf hugo_${HUGO_VER}_linux_amd64 &&\
  chmod +x /usr/local/bin/hugo &&\
  mkdir /data

RUN pip install Pygments

WORKDIR /data

ENTRYPOINT ["/usr/local/bin/hugo"]
