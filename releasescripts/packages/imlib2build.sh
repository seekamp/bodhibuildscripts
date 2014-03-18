#!/bin/bash
. ../setenv.sh

cd ${SRC_E_PATH}/imlib2 && make distclean
./autogen.sh
cp -R ${SRC_E_PATH}/imlib2 ${BLD_E_PATH}/$1/imlib2-$1
cd ${BLD_E_PATH}/$1
tar czvf ${BLD_E_PATH}/$1/imlib2-$1.tar.gz imlib2-$1/

cd ${BLD_E_PATH}/$1/imlib2-$1
make distclean
dh_make --single --yes -e jeffhoogland@linux.com -f ../imlib2-$1.tar.gz

cp ${BLD_E_PATH}/controlfiles/imlib2/control debian/
dpkg-buildpackage -rfakeroot
dpkg -i ../imlib2*.deb
