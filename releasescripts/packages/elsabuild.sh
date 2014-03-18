#!/bin/bash
. ../setenv.sh

cd ${SRC_E_PATH}/elsa && make distclean
./autogen.sh
cp -R ${SRC_E_PATH}/elsa ${BLD_E_PATH}/$1/elsa-$1
cp -f /media/sda5/Bodhi/patches/elsa/data/elsa ${BLD_E_PATH}/$1/elsa-$1/data/
#cp -f /media/sda5/Bodhi/patches/elsa/data/themes/beaumonts/* ${BLD_E_PATH}/$1/elsa-$1/data/themes/beaumonts/
cd ${BLD_E_PATH}/$1
tar czvf ${BLD_E_PATH}/$1/elsa-$1.tar.gz elsa-$1/

cd ${BLD_E_PATH}/$1/elsa-$1
make distclean
dh_make --single --yes -e jeffhoogland@linux.com -f ../elsa-$1.tar.gz

cp -f ${BLD_E_PATH}/controlfiles/elsa/* debian/
dpkg-buildpackage -rfakeroot
dpkg -i ../elsa*.deb
