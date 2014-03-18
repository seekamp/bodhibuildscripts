#!/bin/bash
#BLD_E_PATH is where deb packages are placed. Typically the last directory in
# the path is e17_debs for e17, e18_debs for e18, etc.
# NOTE: the buildscripts directory should be a subdirectory of BLD_E_PATH
export BLD_E_PATH=/build/dev/bodhi/e19_debs
#PATCHES_E_PATH is where patches are placed
export PATCHES_E_PATH=/build/dev/bodhi/patches
#SRC_E_PATH is where source code is placed. Typically the last directory in 
# the path is e17_src for e17, e17_src for e18, etc.
export SRC_E_PATH=/build/dev/bodhi/e19_src
