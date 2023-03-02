# rebased/repackaged base image that only updates existing packages
FROM mbentley/alpine:latest
LABEL maintainer="Matt Bentley <mbentley@mbentley.net>"

RUN apk --no-cache add ca-certificates hugo py-pygments py-setuptools wget &&\
  mkdir /data

WORKDIR /data

ENTRYPOINT ["/usr/bin/hugo"]
CMD [""]
