FROM alpine:latest
MAINTAINER Matt Bentley <mbentley@mbentley.net>

RUN apk --no-cache add ca-certificates py-pygments py-setuptools wget

RUN HUGO_VER="$(wget -q -O - https://api.github.com/repos/gohugoio/hugo/releases/latest | python -c "import sys, json; print json.load(sys.stdin)['name']" | awk -F 'v' '{print $2}')" &&\
  mkdir /tmp/hugo &&\
  cd /tmp/hugo &&\
  wget https://github.com/gohugoio/hugo/releases/download/v${HUGO_VER}/hugo_${HUGO_VER}_Linux-64bit.tar.gz &&\
  tar zxvf hugo_${HUGO_VER}_Linux-64bit.tar.gz &&\
  mv hugo /usr/local/bin/hugo &&\
  cd / &&\
  rm -rf /tmp/hugo &&\
  chmod +x /usr/local/bin/hugo &&\
  mkdir /data

WORKDIR /data

ENTRYPOINT ["/usr/local/bin/hugo"]
CMD [""]
