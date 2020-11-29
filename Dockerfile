ARG RELEASE
FROM alpine:${RELEASE}

LABEL maintainer="StanGirard <stan@primates.dev>"

## Install 
RUN apk --no-cache add curl bind-tools


COPY bin/startup.sh .
RUN "./startup.sh"


