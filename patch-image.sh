#!/bin/sh
set -eux

# TODO: something more robust. Our image tags are unique enough for this to work, for now...
#TARGET=server.yml
#IMAGE=ghcr.io/erosson/multiplayer/server
#TAG=haha
TARGET=$1;shift
IMAGE=$1;shift
TAG=$1;shift

sed -i 's|'$IMAGE':[^"]*|'$IMAGE':'$TAG'|' $TARGET
# exit code - fails if no replacement happened
grep "$IMAGE:$TAG" $TARGET > /dev/null

# This seems to be the more popular way, but I'm putting more than just a deployment in each file and it's replacing too much
# TMP=`mktemp`
# TARGET=server.yml
# NAME=test-multiplayer-server
# IMAGE=ghcr.io/erosson/multiplayer/server:haha
# PATCH='{"kind":"Deployment","spec":{"template":{"spec":{"containers":[{"name": "'"$NAME"'", "image": "'"$IMAGE"'"}]}}}}'
# 
# echo $PATCH
# kubectl patch  --local -f $TARGET -o yaml -p "$PATCH" > $TMP