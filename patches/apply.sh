#!/bin/bash
 cd ../../../..

 cd packages/apps/Settings
 patch -p1 -b < ../../../device/alcatel/4013/patches/android_settings_developer_info.patch
 git clean -f -d

 cd ../../../system/vold
 patch -p1 < ../../device/alcatel/4013/patches/android_system_vold.patch
 
 cd ../sepolicy
 patch -p1 < ../../device/alcatel/4013/patches/android_system_sepolicy.patch
 cd ../../external/icu
 patch -p1 < ../../device/alcatel/4013/patches/android_external_icu.patch

 cd ../../frameworks/av
 patch -p1 < ../../device/alcatel/4013/patches/android_frameworks_av.patch
 mkdir ../../device/alcatel/4013/backup

 cd ../..
 cd packages/apps/FMRadio
 patch -p1 < ../../../device/alcatel/4013/patches/android_packages_apps_FMRadio.patch

 cd ../../../
 
 cd system/sepolicy
 cp mediaserver.te ../../device/alcatel/4013/backup/mediaserver.te
 sudo rm -rf mediaserver.te
 cp ../../device/alcatel/4013/patches/mediaserver.te mediaserver.te
 echo "Patch Success!"
 echo "IF Any Build Error, Restore the backups in repo/device/alcatel/4013/backup"
