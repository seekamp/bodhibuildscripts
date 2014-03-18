#!/bin/bash
. ../setenv.sh

cd ${SRC_E_PATH}/etrophy && make distclean
./autogen.sh
cp -R ${SRC_E_PATH}/etrophy ${BLD_E_PATH}/$1/etrophy-$1
cd ${BLD_E_PATH}/$1
tar czvf ${BLD_E_PATH}/$1/etrophy-$1.tar.gz etrophy-$1/

cd ${BLD_E_PATH}/$1/etrophy-$1
make distclean
dh_make --single --yes -e jeffhoogland@linux.com -f ../etrophy-$1.tar.gz

cp ${BLD_E_PATH}/controlfiles/etrophy/control debian/
dpkg-buildpackage -rfakeroot
dpkg -i ../etrophy*.deb
