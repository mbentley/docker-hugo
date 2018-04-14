mbentley/hugo
==================

docker image for [hugo](https://gohugo.io/)
based off of alpine:latest

To pull this image:
`docker pull mbentley/hugo`

Example usage:

`docker run -it --rm mbentley/hugo --help`

Run server for development

```
docker run -it --rm \
  -u "$(id -u):$(id -g)" \
  -p 1313:1313 \
  -w "${PWD}" \
  -v "${PWD}":"${PWD}" \
  mbentley/hugo server \
  --bind 0.0.0.0
```

Build site

```
docker run -it --rm \
  -u "$(id -u):$(id -g)" \
  -w "${PWD}" \
  -v "${PWD}":"${PWD}" \
  mbentley/hugo \
  -v
```

Make sure to run the above commands with the `-u` and `-g` parameters otherwise you may end up with files that have been written as `root:root`
