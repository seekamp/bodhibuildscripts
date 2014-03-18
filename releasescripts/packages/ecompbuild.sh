#!/bin/bash
. ../setenv.sh

cd ${SRC_E_PATH}/ecomp && make distclean
./autogen.sh
cp -R ${SRC_E_PATH}/ecomp ${BLD_E_PATH}/$1/ecomp-$1
cd ${BLD_E_PATH}/$1
cp ${BLD_E_PATH}/controlfiles/ecomp/control /media/sda5/Bodhi/e17_debs/$1/ecomp-$1/debian/
tar czvf ${BLD_E_PATH}/$1/ecomp-$1.tar.gz ecomp-$1/

cd ${BLD_E_PATH}/$1/ecomp-$1
make distclean
dh_make --single --yes -e jeffhoogland@linux.com -f ../ecomp-$1.tar.gz

dpkg-buildpackage -rfakeroot
dpkg -i ../ecomp*.deb
