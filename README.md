mbentley/hugo
==================

docker image for [hugo](https://gohugo.io/)
based off of alpine:latest

To pull this image:
`docker pull mbentley/hugo`

Example usage:
`docker run -it --rm mbentley/hugo --help`

`docker run -it --rm -p 1313:1313 -v /data/mysite:/data mbentley/hugo server --bind 0.0.0.0`
