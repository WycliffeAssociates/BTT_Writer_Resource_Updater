#!/bin/bash

npm list -g | grep door43-client || npm install -g door43-client
door43-client index -u https://api.bibletranslationtools.org/v2/ts/catalog.json
door43-client download
cd resource_containers
for i in */; do (cd "$i" ; tar -cjvf "${i%/}.tsrc" * ; mv "${i%/}.tsrc" ../ ; cd .. ; rm -rf "$i"); done
cd ..
zip -r resource_containers.zip resource_containers/
