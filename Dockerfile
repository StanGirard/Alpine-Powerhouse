ARG RELEASE
FROM alpine:${RELEASE}

ARG KUBECTL_VERSION=1.20.0

LABEL maintainer="StanGirard <stan@primates.dev>"

## Install 
RUN apk --no-cache add curl bind-tools jq postgresql-client git openssh bash bash-completion

RUN apk add --update --no-cache curl && \
    curl -LO https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl && \
    mv kubectl /usr/bin/kubectl && \
    chmod +x /usr/bin/kubectl

COPY bin/startup.sh .
RUN "./startup.sh"


