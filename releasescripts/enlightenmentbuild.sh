#!/bin/bash
. ./setenv.sh

#cd ${SRC_E_PATH}/$2/enlightenment-$2 && make clean
#./configure
cp -R ${SRC_E_PATH}/$2/enlightenment-$2 ${BLD_E_PATH}/$1/enlightenment-$1

cd ${BLD_E_PATH}/$1/enlightenment-$1/src/modules
rm Makefile.in
rm Makefile_wizard.am
rm -rf wizard
cp -a ${PATCHES_E_PATH}/e17/wizard/* .


cp ${PATCHES_E_PATH}/e17/illume-keyboard/* ${BLD_E_PATH}/$1/enlightenment-$1/src/modules/illume-keyboard/keyboards/

cd ${BLD_E_PATH}/$1/enlightenment-$1/src/bin
patch < ${PATCHES_E_PATH}/e17/e/bodhi_menu.diff
patch < ${PATCHES_E_PATH}/e17/e/module-patch.diff
#patch -p0 < ${PATCHES_E_PATH}/e/e_config.c.patch

cd ${BLD_E_PATH}/$1
tar czvf enlightenment-$1.tar.gz enlightenment-$1/


cd ${BLD_E_PATH}/$1/enlightenment-$1
make distclean
dh_make --single --yes -e jeffhoogland@linux.com -f ../enlightenment-$1.tar.gz

cp -f ${BLD_E_PATH}/controlfiles/enlightenment/* debian/
dpkg-buildpackage -rfakeroot -b
dpkg -i ../enlightenment*.deb
