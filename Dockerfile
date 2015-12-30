FROM alpine:3.3
MAINTAINER Matt Bentley <mbentley@mbentley.net>

RUN apk --update add ca-certificates wget && rm -rf /var/cache/apk/*

ENV HUGO_VER 0.15

RUN wget https://github.com/spf13/hugo/releases/download/v${HUGO_VER}/hugo_${HUGO_VER}_linux_amd64.tar.gz &&\
  tar zxvf hugo_${HUGO_VER}_linux_amd64.tar.gz &&\
  cd hugo_${HUGO_VER}_linux_amd64 &&\
  mv hugo_${HUGO_VER}_linux_amd64 /usr/local/bin/hugo &&\
  cd / &&\
  rm -rf hugo_${HUGO_VER}_linux_amd64 &&\
  chmod +x /usr/local/bin/hugo &&\
  mkdir /data

WORKDIR /data

ENTRYPOINT ["/usr/local/bin/hugo"]
CMD ["help"]
