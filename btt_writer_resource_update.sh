#!/bin/bash

npm install
npm run index
npm run download
cd resource_containers
for i in */; do (cd "$i" ; tar -cjvf "${i%/}.tsrc" * ; mv "${i%/}.tsrc" ../ ; cd .. ; rm -rf "$i"); done
zip -r containers.zip *
cd ..
zip -r resource_containers.zip resource_containers/ index.sqlite
