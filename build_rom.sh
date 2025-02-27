#!/bin/bash

#set -e

cyan='\033[0;36m'
blue='\033[0;34m'
nocol='\033[0m'

echo -e "$cyan***********************************************"
echo -e "            BUILDING ROM from Devspaces CLI         "
echo -e "**********************************************$nocol"

echo -e "$blue***********************************************"
echo -e "         FOSS the TOP free server! Always TOP!       "
echo -e "**********************************************$nocol"

rm -rf .repo/manifests
repo init -u https://github.com/Evolution-X/manifest -b vic --git-lfs
git clone --depth=1 https://github.com/electrolaboratory/local_manifests -b main .repo/local_manifests
/opt/crave/resync.sh
. build/envsetup.sh
lunch lineage_X00TD-ap4a-userdebug
export TZ=Asia/Jakarta
m installclean
m evolution
