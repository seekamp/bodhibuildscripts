#!/bin/bash
if [ -z "$1" ]
then
  echo "Error: Shell script name to fix up (e.g. ecorebuild.sh) required"
  exit 99
fi
sed -ibak1 -e 's/\/home\/jeff/${SRC_E_PATH}/' $1
if [ $? -ne 0 ] 
then
  echo "replace 1 failed"
  exit 1
fi
sed -ibak2 -e 's/\/media\/sda5\/Bodhi\/e17_debs/${BLD_E_PATH}/' $1
if [ $? -ne 0 ] 
then
  echo "replace 2 failed"
  exit 2
fi
if [ -z "$1" ]
then
  echo "Error: Shell script name to fix up (e.g. ecorebuild.sh) required"
  exit 99
fi
sed -ibak3 -e 's/!\/bin\/sh/!\/bin\/bash\n. .\/setenv.sh/' $1
if [ $? -ne 0 ] 
then
  echo "replace 1 failed"
  exit 3
fi
sed -ibak4 -e 's/dh_make -e/dh_make --single --yes -e/' $1
if [ $? -ne 0 ] 
then
  echo "replace 4 failed"
  exit 4
fi
sed -ibak5 -e 's/dh_make -p/dh_make --single --yes -p/' $1
if [ $? -ne 0 ] 
then
  echo "replace 5 failed"
  exit 5
fi
