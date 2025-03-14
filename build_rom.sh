#!/bin/bash

export BUILD_USERNAME="queen"
export BUILD_HOSTNAME="foss-crave"

export TZ=Asia/Jakarta

rm -rf .repo/local_manifests/
repo init -u https://github.com/ProjectMatrixx/android.git -b 15.0 --git-lfs
git clone --depth=1 https://github.com/electrolaboratory/local_manifests -b main .repo/local_manifests

if [ -f /usr/bin/resync ]; then
   /usr/bin/resync
else
   /opt/crave/resync.sh
fi

. build/envsetup.sh
make installclean
brunch X00TD
