#!/bin/bash
. ./setenv.sh

cp -R ${SRC_E_PATH}/$2/efl-$2 ${BLD_E_PATH}/$1/efl-$1
cd ${BLD_E_PATH}/$1
tar czvf ${BLD_E_PATH}/$1/efl-$1.tar.gz efl-$1/

cd ${BLD_E_PATH}/$1/efl-$1
dh_make --single --yes -e jeffhoogland@linux.com -f ../efl-$1.tar.gz
make distclean
cp ${BLD_E_PATH}/controlfiles/efl/* debian/
dpkg-buildpackage -rfakeroot -b
dpkg -i ../efl*.deb

cp -R ${SRC_E_PATH}/$2/efl-$2 ${BLD_E_PATH}/$1/efl-dbg_$1
cd ${BLD_E_PATH}/$1
tar czvf ${BLD_E_PATH}/$1/efl-dbg_$1.tar.gz efl-dbg_$1/

cd ${BLD_E_PATH}/$1/efl-dbg_$1
dh_make --single --yes -p efl-dbg_$1 -e jeffhoogland@linux.com -f ../efl-dbg_$1.tar.gz
make distclean
cp ${BLD_E_PATH}/controlfiles/efl-dbg/* debian/
dpkg-buildpackage -rfakeroot -b
