#!/bin/bash
. ../setenv.sh

cd ${SRC_E_PATH}/everything-tracker && make distclean
./autogen.sh
cp -R ${SRC_E_PATH}/everything-tracker ${BLD_E_PATH}/$1/everything-tracker_$1
cd ${BLD_E_PATH}/$1
tar czvf ${BLD_E_PATH}/$1/everything-tracker_$1.tar.gz everything-tracker_$1/

cd ${BLD_E_PATH}/$1/everything-tracker_$1
dh_make --single --yes -p everything-tracker_$1 -e jeffhoogland@linux.com -f ../everything-tracker_$1.tar.gz

cp ${BLD_E_PATH}/controlfiles/everything-tracker/control debian/
dpkg-buildpackage -rfakeroot
dpkg -i ../everything-tracker*.deb
