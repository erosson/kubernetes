#!/bin/sh
set -eux
# password in a shell is not really safe, but gitpod is isolated enough, right...? 
argocd login \
    --plaintext \
    --port-forward \
    --port-forward-namespace argocd \
    --username $ARGOCD_USERNAME \
    --password $ARGOCD_PASSWORD \