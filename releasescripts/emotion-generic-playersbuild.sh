#!/bin/bash
. ./setenv.sh

cd ${SRC_E_PATH}/$2/emotion_generic_players-$2 && make distclean
./autogen.sh
cp -R ${SRC_E_PATH}/$2/emotion_generic_players-$2 ${BLD_E_PATH}/$1/emotion-generic-players_$1
cd ${BLD_E_PATH}/$1
tar czvf ${BLD_E_PATH}/$1/emotion-generic-players_$1.tar.gz emotion-generic-players_$1/

cd ${BLD_E_PATH}/$1/emotion-generic-players_$1
dh_make --single --yes -p emotion-generic-players_$1 -e jeffhoogland@linux.com -f ../emotion-generic-players_$1.tar.gz

cp ${BLD_E_PATH}/controlfiles/emotion-generic-players/* debian/
dpkg-buildpackage -rfakeroot
dpkg -i ../emotion-generic-players*.deb
