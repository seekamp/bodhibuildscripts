#!/bin/bash
. ../setenv.sh

cd ${SRC_E_PATH}/engage && make distclean
./autogen.sh
cp -R ${SRC_E_PATH}/engage ${BLD_E_PATH}/$1/engage_$1
cd ${BLD_E_PATH}/$1
tar czvf ${BLD_E_PATH}/$1/engage_$1.tar.gz engage_$1/

cd ${BLD_E_PATH}/$1/engage_$1
dh_make --single --yes -p engage_$1 -e jeffhoogland@linux.com -f ../engage_$1.tar.gz

cp ${BLD_E_PATH}/controlfiles/engage/control debian/
dpkg-buildpackage -rfakeroot
dpkg -i ../engage*.deb
