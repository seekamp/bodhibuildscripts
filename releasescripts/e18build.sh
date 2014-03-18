#!/bin/bash
. ./setenv.sh

#Normal package
cp -R ${SRC_E_PATH}/$2/enlightenment-$2 ${BLD_E_PATH}/$1/e18-$1

cp ${PATCHES_E_PATH}/e18/illume-keyboard/* ${BLD_E_PATH}/$1/e18-$1/src/modules/illume-keyboard/keyboards/

cd ${BLD_E_PATH}/$1/e18-$1/src/bin
patch < ${PATCHES_E_PATH}/e18/e/bodhi_menu.diff
patch < ${PATCHES_E_PATH}/e18/e/module-patch.diff

cd ${BLD_E_PATH}/$1
tar czvf e18-$1.tar.gz e18-$1/

cd ${BLD_E_PATH}/$1/e18-$1
make distclean
dh_make --single --yes -e jeffhoogland@linux.com -f ../e18-$1.tar.gz

cp -f ${BLD_E_PATH}/controlfiles/e18/* debian/
dpkg-buildpackage -rfakeroot -b
dpkg -i ../e18*.deb

#Debug package
cp -R ${SRC_E_PATH}/$2/enlightenment-$2 ${BLD_E_PATH}/$1/e18-dbg_$1

cp ${PATCHES_E_PATH}/e18/illume-keyboard/* ${BLD_E_PATH}/$1/e18-dbg_$1/src/modules/illume-keyboard/keyboards/

cd ${BLD_E_PATH}/$1/e18-dbg_$1/src/bin
patch < ${PATCHES_E_PATH}/e18/e/bodhi_menu.diff
patch < ${PATCHES_E_PATH}/e18/e/module-patch.diff

cd ${BLD_E_PATH}/$1
tar czvf e18-dbg_$1.tar.gz e18-dbg_$1/

cd ${BLD_E_PATH}/$1/e18-dbg_$1
make distclean
dh_make --single --yes -p e18-dbg_$1 -e jeffhoogland@linux.com -f ../e18-dbg_$1.tar.gz

cp -f ${BLD_E_PATH}/controlfiles/e18-dbg/* debian/
dpkg-buildpackage -rfakeroot -b
