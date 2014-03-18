#!/bin/bash
. ../setenv.sh

cd ${SRC_E_PATH}/elfe && make distclean
./autogen.sh
cp -R ${SRC_E_PATH}/elfe ${BLD_E_PATH}/$1/elfe-$1
cp -f /media/sda5/Bodhi/patches/elfe/* ${BLD_E_PATH}/$1/elfe-$1/data/themes/default/images/
cd ${BLD_E_PATH}/$1
tar czvf ${BLD_E_PATH}/$1/elfe-$1.tar.gz elfe-$1/

cd ${BLD_E_PATH}/$1/elfe-$1
make distclean
dh_make --single --yes -e jeffhoogland@linux.com -f ../elfe-$1.tar.gz

cp ${BLD_E_PATH}/controlfiles/elfe/control debian/
dpkg-buildpackage -rfakeroot
dpkg -i ../elfe*.deb
