#!/bin/sh
set -eux

PACKAGE=$1;shift
TAG=$1;shift

git add packages

git config --global user.name "erosson's kubernetes deploybot"
git config --global user.email "erosson@users.noreply.github.com"
git commit -m "[auto] bump \`$PACKAGE\` images to \`$TAG\`"