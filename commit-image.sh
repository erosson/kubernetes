#!/bin/sh
set -eux

PACKAGE=$1;shift
TAG=$1;shift

git add packages
git commit -m "[auto] bump \`$PACKAGE\` images to \`$TAG\`"