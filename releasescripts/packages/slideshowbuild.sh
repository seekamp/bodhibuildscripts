#!/bin/bash
. ../setenv.sh

cd ${SRC_E_PATH}/slideshow && make distclean
./autogen.sh
cp -R ${SRC_E_PATH}/slideshow ${BLD_E_PATH}/$1/slideshow-$1
cd ${BLD_E_PATH}/$1
tar czvf ${BLD_E_PATH}/$1/slideshow-$1.tar.gz slideshow-$1/

cd ${BLD_E_PATH}/$1/slideshow-$1
make distclean
dh_make --single --yes -e jeffhoogland@linux.com -f ../slideshow-$1.tar.gz

cp ${BLD_E_PATH}/controlfiles/slideshow/control debian/
dpkg-buildpackage -rfakeroot
dpkg -i ../slideshow*.deb
