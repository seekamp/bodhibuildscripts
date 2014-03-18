#!/bin/bash
. ../setenv.sh

cd ${SRC_E_PATH}/calendar && make distclean
./autogen.sh
cp -R ${SRC_E_PATH}/calendar ${BLD_E_PATH}/$1/calendar-$1
cd ${BLD_E_PATH}/$1
tar czvf ${BLD_E_PATH}/$1/calendar-$1.tar.gz calendar-$1/

cd ${BLD_E_PATH}/$1/calendar-$1
make distclean
dh_make --single --yes -e jeffhoogland@linux.com -f ../calendar-$1.tar.gz

cp ${BLD_E_PATH}/controlfiles/calendar/control debian/
dpkg-buildpackage -rfakeroot
dpkg -i ../calendar*.deb
