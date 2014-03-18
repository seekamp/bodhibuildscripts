#!/bin/bash
. ../setenv.sh

cd ${SRC_E_PATH}/mail && make distclean
./autogen.sh
cp -R ${SRC_E_PATH}/mail ${BLD_E_PATH}/$1/mail-$1
cd ${BLD_E_PATH}/$1
tar czvf ${BLD_E_PATH}/$1/mail-$1.tar.gz mail-$1/

cd ${BLD_E_PATH}/$1/mail-$1
make distclean
yes | dh_make --single -e jeffhoogland@linux.com -f ../mail-$1.tar.gz

cp ${BLD_E_PATH}/controlfiles/mail/control debian/
dpkg-buildpackage -rfakeroot
dpkg -i ../mail*.deb
