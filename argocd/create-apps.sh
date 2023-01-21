#!/bin/sh
set -eu

create()
{
    argocd app create --port-forward-namespace argocd \
        --sync-policy automatic \
        --repo https://github.com/erosson/kubernetes.git \
        --revision HEAD \
        --dest-server https://kubernetes.default.svc \
        --dest-namespace default \
        --upsert \
        "$@"
}

# Continuous delivery using argocd-image-updater.
# Whenever we push to erosson/multiplayer, github-actions builds a docker image and pushes it to github's container registry (ghcr.io)
# argocd-image-updater polls for changes to these images, and pushes the latest one, thanks to all these annotations.
# https://argocd-image-updater.readthedocs.io/en/stable/basics/update-strategies/
create test-multiplayer.erosson.org --path packages/erosson/multiplayer \
    --annotations argocd-image-updater.argoproj.io/image-list=server=ghcr.io/erosson/multiplayer/server:latest,www=ghcr.io/erosson/multiplayer/www:latest \
    --annotations argocd-image-updater.argoproj.io/server.update-strategy=digest \
    --annotations argocd-image-updater.argoproj.io/www.update-strategy=digest

#exit 0
create test-letsencrypt-staging.erosson.org --path examples/test-letsencrypt-staging.erosson.org
create test-letsencrypt.erosson.org --path examples/test-letsencrypt.erosson.org
create test-letsencrypt-cfproxy.erosson.org --path examples/test-letsencrypt-cfproxy.erosson.org
create k8s-test-hello1.erosson.org --path examples/k8s-test-hello1.erosson.org
create k8s-test-hello2.erosson.org --path examples/k8s-test-hello2.erosson.org
create cluster-config --path cluster-config