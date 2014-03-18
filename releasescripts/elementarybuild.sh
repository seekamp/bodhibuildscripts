#!/bin/bash
. ./setenv.sh

cp -R ${SRC_E_PATH}/$2/elementary-$2 ${BLD_E_PATH}/$1/elementary-$1
cd ${BLD_E_PATH}/$1
tar czvf ${BLD_E_PATH}/$1/elementary-$1.tar.gz elementary-$1/

cd ${BLD_E_PATH}/$1/elementary-$1
dh_make --single --yes -e jeffhoogland@linux.com -f ../elementary-$1.tar.gz
make distclean
cp ${BLD_E_PATH}/controlfiles/elementary/* debian/
dpkg-buildpackage -rfakeroot -b
dpkg -i ../elementary*.deb

cp -R ${SRC_E_PATH}/$2/elementary-$2 ${BLD_E_PATH}/$1/elementary-dbg_$1
cd ${BLD_E_PATH}/$1
tar czvf ${BLD_E_PATH}/$1/elementary-dbg_$1.tar.gz elementary-dbg_$1/

cd ${BLD_E_PATH}/$1/elementary-dbg_$1
dh_make --single --yes -p elementary-dbg_$1 -e jeffhoogland@linux.com -f ../elementary-dbg_$1.tar.gz
make distclean
cp ${BLD_E_PATH}/controlfiles/elementary-dbg/* debian/
dpkg-buildpackage -rfakeroot -b
