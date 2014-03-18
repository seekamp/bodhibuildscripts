#!/bin/bash
. ../setenv.sh

cd ${SRC_E_PATH}/places && make distclean
./autogen.sh
cp -R ${SRC_E_PATH}/places ${BLD_E_PATH}/$1/places-$1
cd ${BLD_E_PATH}/$1
tar czvf ${BLD_E_PATH}/$1/places-$1.tar.gz places-$1/

cd ${BLD_E_PATH}/$1/places-$1
make distclean
dh_make --single --yes -e jeffhoogland@linux.com -f ../places-$1.tar.gz

cp ${BLD_E_PATH}/controlfiles/places/control debian/
dpkg-buildpackage -rfakeroot
dpkg -i ../places*.deb
