#!/bin/bash
. ../setenv.sh

cd ${SRC_E_PATH}/e && make distclean
./autogen.sh
cp -R ${SRC_E_PATH}/e ${BLD_E_PATH}/$1/enlightenment-$1

cd ${BLD_E_PATH}/$1/enlightenment-$1/src/modules
rm -rf wizard
rm Makefile
rm Makefile_wizard.am
cp -a ${PATCHES_E_PATH}/wizard/* .

cp ${PATCHES_E_PATH}/illume-keyboard/* ${BLD_E_PATH}/$1/enlightenment-$1/src/modules/illume-keyboard/keyboards/

cd ${BLD_E_PATH}/$1/enlightenment-$1/src/bin
patch < ${PATCHES_E_PATH}/e/bodhi_menu.diff
patch < ${PATCHES_E_PATH}/e/module-patch.diff
patch -p0 < ${PATCHES_E_PATH}/e/e_config.c.patch

cd ${BLD_E_PATH}/$1
tar czvf enlightenment-$1.tar.gz enlightenment-$1/


cd ${BLD_E_PATH}/$1/enlightenment-$1
make distclean
dh_make --single --yes -e jeffhoogland@linux.com -f ../enlightenment-$1.tar.gz

cp -f ${BLD_E_PATH}/controlfiles/enlightenment/* debian/
dpkg-buildpackage -rfakeroot -b
dpkg -i ../enlightenment*.deb
