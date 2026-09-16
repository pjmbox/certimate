#!/usr/bin/env bash

cd $(dirname $0)

echo 'compile web'
cd ui
npm install
npm run build
rm -f ../../artifacts/dist.tgz
tar -czf ../../artifacts/dist.tgz ./dist

echo 'compile go'
cd ..
go build -ldflags="-s -w" -o certimate .
rm -f ../artifacts/certimate
mv certimate ../artifacts/

