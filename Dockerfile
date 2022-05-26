# rebased/repackaged base image that only updates existing packages
FROM mbentley/alpine:latest
LABEL maintainer="Matt Bentley <mbentley@mbentley.net>"

RUN apk --no-cache add ca-certificates libc6-compat py-pygments py-setuptools wget

ARG HUGO_VER

RUN apk --no-cache add jq &&\
  HUGO_VER="$(if [ -z "${HUGO_VER}" ]; then wget -q -O - https://api.github.com/repos/gohugoio/hugo/releases/latest | jq -r .name | awk -F 'v' '{print $2}'; else echo "${HUGO_VER}"; fi)" &&\
  if [ "$(uname -m)" = "aarch64" ]; then HUGO_BIN="hugo"; HUGO_ARCH="Linux-ARM64"; elif [ "$(uname -m)" = "x86_64" ]; then HUGO_BIN="hugo_extended"; HUGO_ARCH="Linux-64bit"; else echo "ERROR: unknown architecture"; exit 1; fi &&\
  mkdir /tmp/hugo &&\
  cd /tmp/hugo &&\
  wget -nv "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VER}/${HUGO_BIN}_${HUGO_VER}_${HUGO_ARCH}.tar.gz" &&\
  tar zxvf "${HUGO_BIN}_${HUGO_VER}_${HUGO_ARCH}.tar.gz" &&\
  mv hugo /usr/local/bin/hugo &&\
  cd / &&\
  rm -rf /tmp/hugo &&\
  chmod +x /usr/local/bin/hugo &&\
  mkdir /data &&\
  apk --no-cache del jq

WORKDIR /data

ENTRYPOINT ["/usr/local/bin/hugo"]
CMD [""]
