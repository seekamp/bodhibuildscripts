#!/bin/bash
. ./setenv.sh

cd ${SRC_E_PATH}/$2/evas_generic_loaders-$2 && make distclean
./autogen.sh
cp -R ${SRC_E_PATH}/$2/evas_generic_loaders-$2 ${BLD_E_PATH}/$1/evas-generic-loaders_$1
cd ${BLD_E_PATH}/$1
tar czvf ${BLD_E_PATH}/$1/evas-generic-loaders_$1.tar.gz evas-generic-loaders_$1/

cd ${BLD_E_PATH}/$1/evas-generic-loaders_$1
dh_make --single --yes -p evas-generic-loaders_$1 -e jeffhoogland@linux.com -f ../evas-generic-loaders_$1.tar.gz

cp ${BLD_E_PATH}/controlfiles/evas-generic-loaders/* debian/
dpkg-buildpackage -rfakeroot
dpkg -i ../evas-generic-loaders*.deb
