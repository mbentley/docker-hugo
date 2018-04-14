FROM alpine:latest
MAINTAINER Matt Bentley <mbentley@mbentley.net>

RUN apk --no-cache add ca-certificates py-pygments py-setuptools wget

ENV HUGO_VER 0.38.2

RUN mkdir /tmp/hugo &&\
  cd /tmp/hugo &&\
  wget https://github.com/gohugoio/hugo/releases/download/v${HUGO_VER}/hugo_${HUGO_VER}_Linux-64bit.tar.gz &&\
  tar zxvf hugo_${HUGO_VER}_Linux-64bit.tar.gz &&\
  mv hugo /usr/local/bin/hugo &&\
  cd / &&\
  rm -rf /tmp/hugo &&\
  chmod +x /usr/local/bin/hugo &&\
  mkdir /data

#RUN pip install Pygments

WORKDIR /data

ENTRYPOINT ["/usr/local/bin/hugo"]
CMD ["--help"]
