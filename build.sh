#!/usr/bin/env bash

cd $(dirname $0)

[ -d ../build ] || mkdir ../build

echo 'compile web'
cd ui
npm install
npm run build
rm -f ../../build/dist.tgz
tar -czf ../../build/dist.tgz ./dist

echo 'compile go'
cd ..
go build -ldflags="-s -w" -o certimate .
rm -f ../build/certimate
mv certimate ../build/

