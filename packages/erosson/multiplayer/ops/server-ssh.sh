#!/bin/sh
set -euxi

# https://stackoverflow.com/questions/46474972/kubernetes-kubectl-get-running-pods
# https://stackoverflow.com/questions/45714658/need-to-do-ssh-to-kubernetes-pod
POD=`kubectl get pod -l app=test-multiplayer-server --field-selector=status.phase==Running -o jsonpath="{.items[0].metadata.name}"`
kubectl exec -it $POD -- bash