#!/bin/bash
. ../setenv.sh

cd ${SRC_E_PATH}/everything-websearch && make distclean
./autogen.sh
cp -R ${SRC_E_PATH}/everything-websearch ${BLD_E_PATH}/$1/everything-websearch_$1
cd ${BLD_E_PATH}/$1
tar czvf ${BLD_E_PATH}/$1/everything-websearch_$1.tar.gz everything-websearch_$1/

cd ${BLD_E_PATH}/$1/everything-websearch_$1
dh_make --single --yes -p everything-websearch_$1 -e jeffhoogland@linux.com -f ../everything-websearch_$1.tar.gz

cp ${BLD_E_PATH}/controlfiles/everything-websearch/control debian/
dpkg-buildpackage -rfakeroot
dpkg -i ../everything-websearch*.deb
