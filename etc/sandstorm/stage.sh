#! /bin/bash
#
# Copyright (c) 2016, JGraph Ltd

# https://stackoverflow.com/questions/59895/can-a-bash-script-tell-what-directory-its-stored-in
mkdir -p build/.sandstorm/client
cp -v ssindex.html build/.sandstorm/client
cp -v sandstorm-pkgdef.capnp build/.sandstorm
cp -v ChangeLog build/.sandstorm
cp -v pgp-keyring build/.sandstorm
cp -v pgp-signature build/.sandstorm
cp -v description.md build/.sandstorm
cp -v shortDesc.txt build/.sandstorm
cp -v Makefile build/.sandstorm
cp -v server.c++ build/.sandstorm
#cp -v ../../src/main/webapp/export.html build/.sandstorm/client
cp -v ../../src/main/webapp/favicon.ico build/.sandstorm/client
cp -v ../../src/main/webapp/open.html build/.sandstorm/client
#cp -v ../../src/main/webapp/stencils.xml build/.sandstorm/client
#cp -v ../../src/main/webapp/search.xml build/.sandstorm/client
mkdir -p  build/.sandstorm/client/images
cp -rf ../../src/main/webapp/images/* build/.sandstorm/client/images/
cp -v images/drawio448.png build/.sandstorm/client/images/
mkdir -p build/.sandstorm/client/img
cp -rf ../../src/main/webapp/img/* build/.sandstorm/client/img/
mkdir -p build/.sandstorm/client/js
cp -rf ../../src/main/webapp/js/* build/.sandstorm/client/js/
mkdir -p build/.sandstorm/client/mxgraph
cp -rf ../../src/main/webapp/mxgraph/* build/.sandstorm/client/mxgraph/
mkdir -p build/.sandstorm/client/plugins
cp -rf ../../src/main/webapp/plugins/* build/.sandstorm/client/plugins/
mkdir -p build/.sandstorm/client/resources
cp -rf ../../src/main/webapp/resources/* build/.sandstorm/client/resources/
mkdir -p build/.sandstorm/client/shapes
cp -rf ../../src/main/webapp/shapes/* build/.sandstorm/client/shapes/
mkdir -p build/.sandstorm/client/stencils
cp -rf ../../src/main/webapp/stencils/* build/.sandstorm/client/stencils/
mkdir -p build/.sandstorm/client/styles
cp -rf ../../src/main/webapp/styles/* build/.sandstorm/client/styles/
mkdir -p build/.sandstorm/client/templates
cp -rf ../../src/main/webapp/templates/* build/.sandstorm/client/templates/

echo "Compressing assets"
find build/.sandstorm/client -name '*.html' -o -name '*.css' -o -name '*.js' -o -name '*.txt' -o -name '*.xml' | xargs gzip -k

echo "Creating file list"
cd build/.sandstorm
find ./client -type f -printf "%p\n" | cut -c 3- >  sandstorm-files.list
cat ../../rootFiles >> sandstorm-files.list
