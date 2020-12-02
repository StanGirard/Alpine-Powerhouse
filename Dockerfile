ARG RELEASE
FROM alpine:${RELEASE}

LABEL maintainer="StanGirard <stan@primates.dev>"

## Install 
RUN apk --no-cache add curl bind-tools jq postgresql-client git openssh


COPY bin/startup.sh .
RUN "./startup.sh"


