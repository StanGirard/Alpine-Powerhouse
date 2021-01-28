#!/bin/sh
echo "================================================="
curl --version
dig -v
jq --version
psql --version
git --version
ssh -V
kubectl version --client
echo "================================================="
