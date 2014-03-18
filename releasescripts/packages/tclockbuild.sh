#!/bin/bash
. ../setenv.sh

cd ${SRC_E_PATH}/tclock && make distclean
./autogen.sh
cp -R ${SRC_E_PATH}/tclock ${BLD_E_PATH}/$1/tclock-$1
cd ${BLD_E_PATH}/$1
tar czvf ${BLD_E_PATH}/$1/tclock-$1.tar.gz tclock-$1/

cd ${BLD_E_PATH}/$1/tclock-$1
make distclean
dh_make --single --yes -e jeffhoogland@linux.com -f ../tclock-$1.tar.gz

cp ${BLD_E_PATH}/controlfiles/tclock/control debian/
dpkg-buildpackage -rfakeroot
dpkg -i ../tclock*.deb
