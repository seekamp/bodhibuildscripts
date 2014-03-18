#!/bin/bash
. ../setenv.sh

cd ${SRC_E_PATH}/desksanity && make distclean
./autogen.sh
cp -R ${SRC_E_PATH}/desksanity ${BLD_E_PATH}/$1/desksanity-$1
cd ${BLD_E_PATH}/$1
tar czvf ${BLD_E_PATH}/$1/desksanity-$1.tar.gz desksanity-$1/

cd ${BLD_E_PATH}/$1/desksanity-$1
make distclean
dh_make --single --yes -e jeffhoogland@linux.com -f ../desksanity-$1.tar.gz

cp ${BLD_E_PATH}/controlfiles/desksanity/control debian/
dpkg-buildpackage -rfakeroot
dpkg -i ../desksanity*.deb
