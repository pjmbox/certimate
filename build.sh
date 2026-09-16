#!/usr/bin/env bash

cd $(dirname $0)

echo 'compile go'
rm -rf ui/dist
go build -ldflags="-s -w" -o certimate .
rm -f ../artifacts/certimate
mv certimate ../artifacts/

echo 'compile web'
cd ui
npm install
npm run build
rm -f ../../artifacts/dist.tgz
tar -czf ../../artifacts/dist.tgz ./dist

