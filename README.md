# Serverless #

[![Build Status](https://gitlab.com/StanGirard/alpine-powerhouse/badges/main/pipeline.svg)](https://gitlab.com/StanGirard/alpine-powerhouse/)

A [docker image](https://hub.docker.com/r/stangirard/alpine-powerhouse) for running alpine with already built in tools such as curl & dig

This can be useful for debugging purposes.

The `VERSION` file contains the [alpine release](https://hub.docker.com/_/alpine) to be used as base.

## Example ##

```
$ docker pull stangirard/alpine-powerhouse
$ docker run --rm stangirard/serverless curl https://primates.dev
```

## Base image ##

[Alpine](https://hub.docker.com/_/alpine)

Included packages from base image:

- Curl
- DNS Lookup utility

## Check the installed tools

```bash
docker run -it --rm --entrypoint="./startup.sh" stangirard/alpine-powerhouse

=================================================
curl 7.69.1 (x86_64-alpine-linux-musl) libcurl/7.69.1 OpenSSL/1.1.1g zlib/1.2.11 nghttp2/1.41.0
Release-Date: 2020-03-11
Protocols: dict file ftp ftps gopher http https imap imaps pop3 pop3s rtsp smb smbs smtp smtps telnet tftp 
Features: AsynchDNS HTTP2 HTTPS-proxy IPv6 Largefile libz NTLM NTLM_WB SSL TLS-SRP UnixSockets
DiG 9.16.6
=================================================
```
