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

# for the vscode extension on gitpod
#    "vscode-kubernetes.kubectl-path.linux": "/home/gitpod/.local/state/vs-kubernetes/tools/kubectl/kubectl",
#    "vscode-kubernetes.helm-path.linux": "/home/gitpod/.local/state/vs-kubernetes/tools/helm/linux-amd64/helm",
#    "vscode-kubernetes.minikube-path.linux": "/home/gitpod/.local/state/vs-kubernetes/tools/minikube/linux-amd64/minikube"
mkdir -p $HOME/.local/state/vs-kubernetes/tools/kubectl
cp kubectl $HOME/.local/state/vs-kubernetes/tools/kubectl/kubectl

rm -f kubectl kubectl.sha256 $HOME/.local/bin/kubectl
