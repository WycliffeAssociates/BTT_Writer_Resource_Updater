#!/bin/bash

npm install
npm run index
npm run download
cd resource_containers
for i in */; do (cd "$i" ; tar -cjvf "${i%/}.tsrc" * ; mv "${i%/}.tsrc" ../ ; cd .. ; rm -rf "$i"); done
zip -r containers.zip *
zip -r containers-en.zip en*
mv containers.zip ../
mv containers-en.zip ../
cd ..
zip -r resource_containers.zip resource_containers/ index.sqlite
docker run --rm -u $(id -u ${USER}):$(id -g ${USER}) -v $(pwd):/workspace keinos/sqlite3 sqlite3 /workspace/index.sqlite "PRAGMA user_version = 1;"
