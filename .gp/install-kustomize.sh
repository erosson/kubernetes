#!/bin/sh
set -eu

cd `mktemp -d`
curl -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh"  | bash
sudo install -m 555 kustomize /usr/local/bin/kustomize
rm -rf kustomize