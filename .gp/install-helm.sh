#!/bin/sh
# https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/
set -eux
cd "`dirname "$0"`"
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
helm version --client

# for the vscode extension on gitpod
#    "vscode-kubernetes.helm-path.linux": "/home/gitpod/.local/state/vs-kubernetes/tools/helm/linux-amd64/helm",

mkdir -p $HOME/.local/state/vs-kubernetes/tools/helm/linux-amd64/helm
cp `which helm` $HOME/.local/state/vs-kubernetes/tools/helm/linux-amd64/helm

rm -f get_helm.sh