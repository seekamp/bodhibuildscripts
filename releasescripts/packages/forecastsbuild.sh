#!/bin/bash
. ../setenv.sh

cd ${SRC_E_PATH}/forecasts && make distclean
./autogen.sh
cp -R ${SRC_E_PATH}/forecasts ${BLD_E_PATH}/$1/forecasts-$1
cd ${BLD_E_PATH}/$1
tar czvf ${BLD_E_PATH}/$1/forecasts-$1.tar.gz forecasts-$1/

cd ${BLD_E_PATH}/$1/forecasts-$1
make distclean
dh_make --single --yes -e jeffhoogland@linux.com -f ../forecasts-$1.tar.gz

cp ${BLD_E_PATH}/controlfiles/forecasts/control debian/
dpkg-buildpackage -rfakeroot
dpkg -i ../forecasts*.deb
