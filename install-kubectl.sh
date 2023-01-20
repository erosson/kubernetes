#!/bin/sh
# https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/
set -eux
cd "`dirname "$0"`"
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
echo "$(cat kubectl.sha256) kubectl" | sha256sum --check
chmod +x kubectl
# mv -f kubectl $HOME/.local/bin/kubectl
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
kubectl version --client

rm -f kubectl kubectl.sha256 $HOME/.local/bin/kubectl
