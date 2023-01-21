#!/bin/sh
set -eu

create()
{
    argocd app create --port-forward-namespace argocd \
        --sync-policy automatic \
        --revision HEAD \
        --dest-server https://kubernetes.default.svc \
        --dest-namespace default \
        --upsert \
        "$@"
}

create test-multiplayer.erosson.org \
    --repo https://github.com/erosson/multiplayer.git \
    --path k8s

create test-letsencrypt-staging.erosson.org \
    --repo https://github.com/erosson/kubernetes.git \
    --path examples/test-letsencrypt-staging.erosson.org

create test-letsencrypt.erosson.org \
    --repo https://github.com/erosson/kubernetes.git \
    --path examples/test-letsencrypt.erosson.org

create test-letsencrypt-cfproxy.erosson.org \
    --repo https://github.com/erosson/kubernetes.git \
    --path examples/test-letsencrypt-cfproxy.erosson.org

create k8s-test-hello1.erosson.org \
    --repo https://github.com/erosson/kubernetes.git \
    --path examples/k8s-test-hello1.erosson.org

create k8s-test-hello2.erosson.org \
    --repo https://github.com/erosson/kubernetes.git \
    --path examples/k8s-test-hello2.erosson.org

create cluster-config \
    --repo https://github.com/erosson/kubernetes.git \
    --path cluster-config