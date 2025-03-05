#!/bin/bash

export TZ=Asia/Jakarta

rm -rf .repo/local_manifests/
repo init -u https://github.com/Evolution-X/manifest -b vic --git-lfs
git clone --depth=1 https://github.com/electrolaboratory/local_manifests -b main .repo/local_manifests

if [ -f /usr/bin/resync ]; then
   /usr/bin/resync
else
   /opt/crave/resync.sh
fi

. build/envsetup.sh
lunch lineage_X00TD-ap4a-userdebug
export TZ=Asia/Jakarta
make installclean
m evolution
