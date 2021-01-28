# Alpine Powerhouse #

<!-- [![Build Status](https://gitlab.com/StanGirard/alpine-powerhouse/badges/main/pipeline.svg)](https://gitlab.com/StanGirard/alpine-powerhouse/) -->

A [docker image](https://hub.docker.com/r/stangirard/alpine-powerhouse) for running alpine with already built in tools such as curl, dig, git, psql, jq, ssh, kubectl

This can be useful for debugging or CI purposes

The `VERSION` file contains the [alpine release](https://hub.docker.com/_/alpine) to be used as base.

## Example ##

```
$ docker pull stangirard/alpine-powerhouse
$ docker run --rm stangirard/alpine-powerhouse curl https://primates.dev
```

## Base image ##

[Alpine](https://hub.docker.com/_/alpine)

Included packages from base image:

- Curl
- DNS Lookup utility
- jq
- psql-client
- git
- ssh
- kubectl

## Check the installed tools

```bash
docker run -it --rm --entrypoint="./startup.sh" stangirard/alpine-powerhouse

=================================================
curl 7.74.0 
DiG 9.16.11
jq-master-v20200917-3811-g2b0a3891bf
psql (PostgreSQL) 13.1
git version 2.30.0
OpenSSH_8.4p1, OpenSSL 1.1.1i  8 Dec 2020
Kubectl {Major:"1", Minor:"20" }
=================================================
```
