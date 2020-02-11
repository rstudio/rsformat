#!/bin/sh

set -e

cd "$(dirname $0)/.."

if [ ! -d ../rstrap ]; then
  echo "ERROR: rstrap not detected; please clone it as a sibling of this repo" >&2
  exit 1
fi

if ! which jq > /dev/null; then
  echo "ERROR: jq not detected; please make sure it's installed and on the path" >&2
  exit 1
fi

rm -rf inst/rstrap
mkdir -p inst/rstrap

cp ../rstrap/dist/rstrap.css ../rstrap/dist/rstrap.js inst/rstrap/
cat ../rstrap/package.json | jq -r .version > inst/rstrap/VERSION
