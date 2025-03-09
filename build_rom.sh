#!/bin/bash

export BUILD_USERNAME="queen"
export BUILD_HOSTNAME="foss-crave"

export TZ=Asia/Jakarta
sudo ln -sf /usr/share/zoneinfo/Asia/Jakarta /etc/localtime

rm -rf .repo/local_manifests/
repo init --depth=1 --no-repo-verify --git-lfs -u https://github.com/ProjectInfinity-X/manifest -b 15 -g default,-mips,-darwin,-notdefault
git clone --depth=1 https://github.com/electrolaboratory/local_manifests -b main .repo/local_manifests

if [ -f /usr/bin/resync ]; then
   /usr/bin/resync
else
   /opt/crave/resync.sh
fi

. build/envsetup.sh
lunch infinity_X00TD-userdebug
make installclean
mka bacon
