#!/bin/bash
. ../setenv.sh

cd ${SRC_E_PATH}/penguins && make distclean
./autogen.sh
cp -R ${SRC_E_PATH}/penguins ${BLD_E_PATH}/$1/penguins-$1
cd ${BLD_E_PATH}/$1
tar czvf ${BLD_E_PATH}/$1/penguins-$1.tar.gz penguins-$1/

cd ${BLD_E_PATH}/$1/penguins-$1
make distclean
dh_make --single --yes -e jeffhoogland@linux.com -f ../penguins-$1.tar.gz

cp ${BLD_E_PATH}/controlfiles/penguins/control debian/
dpkg-buildpackage -rfakeroot
dpkg -i ../penguins*.deb
