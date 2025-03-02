#!/bin/bash

export TZ=Asia/Jakarta

rm -rf .repo/local_manifests/

repo init -u https://github.com/AxionAOSP/android.git -b lineage-22.1 --git-lfs

git clone --depth=1 https://github.com/electrolaboratory/local_manifests -b main .repo/local_manifests

if [ -f /usr/bin/resync ]; then
   /usr/bin/resync
else
   /opt/crave/resync.sh
fi

. build/envsetup.sh
breakfast X00TD userdebug
gk -s
make installclean
mka bacon
