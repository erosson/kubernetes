#!/bin/sh
# why not a submodule? because argocd tries to clone it to compare differences, and I don't want to screw around with auth for it
set -eu
cd "`dirname "$0"`/.."
git clone https://github.com/erosson/kubernetes-secrets.git secrets