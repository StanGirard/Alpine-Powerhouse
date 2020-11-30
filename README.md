# Alpine Powerhouse #

<!-- [![Build Status](https://gitlab.com/StanGirard/alpine-powerhouse/badges/main/pipeline.svg)](https://gitlab.com/StanGirard/alpine-powerhouse/) -->

A [docker image](https://hub.docker.com/r/stangirard/alpine-powerhouse) for running alpine with already built in tools such as curl, dig, git, psql, jq

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

## Check the installed tools

```bash
docker run -it --rm --entrypoint="./startup.sh" stangirard/alpine-powerhouse

=================================================
curl 7.69.1
DiG 9.16.6
jq-master-v20200428-28-g864c859e9d
psql (PostgreSQL) 12.5
git version 2.26.2
=================================================
```
