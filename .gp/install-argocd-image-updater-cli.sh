#!/bin/sh
set -eu

cd `mktemp -d`
wget https://github.com/argoproj-labs/argocd-image-updater/releases/download/v0.12.1/argocd-image-updater-linux_amd64
sudo install -m 555 argocd-image-updater-* /usr/local/bin/argocd-image-updater
rm -rf argocd-image-updater-*