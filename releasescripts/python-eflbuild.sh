#!/bin/bash
. ./setenv.sh

cp -R ${SRC_E_PATH}/$2/python-efl-$2 ${BLD_E_PATH}/$1/python-efl_$1
cd ${BLD_E_PATH}/$1
tar czvf ${BLD_E_PATH}/$1/python-efl_$1.tar.gz python-efl_$1/

cd ${BLD_E_PATH}/$1/python-efl_$1
dh_make --single --yes -p python-efl_$1 -e jeffhoogland@linux.com -f ../python-efl_$1.tar.gz

cp ${BLD_E_PATH}/controlfiles/python-efl/* debian/
dpkg-buildpackage -rfakeroot -b
dpkg -i ../python-efl*.deb

cp -R ${SRC_E_PATH}/$2/python-efl-$2 ${BLD_E_PATH}/$1/python-efl-dbg_$1
cd ${BLD_E_PATH}/$1
tar czvf ${BLD_E_PATH}/$1/python-efl-dbg_$1.tar.gz python-efl-dbg_$1/

cd ${BLD_E_PATH}/$1/python-efl-dbg_$1
dh_make --single --yes -p python-efl-dbg_$1 -e jeffhoogland@linux.com -f ../python-efl-dbg_$1.tar.gz

cp ${BLD_E_PATH}/controlfiles/python-efl-dbg/* debian/
dpkg-buildpackage -rfakeroot -b
