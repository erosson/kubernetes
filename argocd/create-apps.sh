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

create test-multiplayer.erosson.org --path packages/erosson/multiplayer

create test-letsencrypt-staging.erosson.org --path examples/test-letsencrypt-staging.erosson.org
create test-letsencrypt.erosson.org --path examples/test-letsencrypt.erosson.org
create test-letsencrypt-cfproxy.erosson.org --path examples/test-letsencrypt-cfproxy.erosson.org
create k8s-test-hello1.erosson.org --path examples/k8s-test-hello1.erosson.org
create k8s-test-hello2.erosson.org --path examples/k8s-test-hello2.erosson.org
create cluster-config --path cluster-config