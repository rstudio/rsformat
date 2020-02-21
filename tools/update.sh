#!/bin/bash

set -e
set -x

cd "$(dirname $0)"

cd rstrap
npm install
make clean
make
cd ..

cp rstrap/dist/rstrap.css rstrap/dist/rstrap.js ../inst/rstrap/
