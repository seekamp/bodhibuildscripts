#!/bin/bash
. ../setenv.sh

cd ${SRC_E_PATH}/tiling && make distclean
./autogen.sh
cp -R ${SRC_E_PATH}/tiling ${BLD_E_PATH}/$1/tiling-$1
cd ${BLD_E_PATH}/$1
tar czvf ${BLD_E_PATH}/$1/tiling-$1.tar.gz tiling-$1/

cd ${BLD_E_PATH}/$1/tiling-$1
make distclean
dh_make --single --yes -e jeffhoogland@linux.com -f ../tiling-$1.tar.gz

cp ${BLD_E_PATH}/controlfiles/tiling/control debian/
dpkg-buildpackage -rfakeroot
dpkg -i ../tiling*.deb
