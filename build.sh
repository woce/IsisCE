#!/bin/bash

LUNA_STAGING=/home/dkirker/woce-build/staging/armv7
export QTDIR=/home/dkirker/woce-build/packages/sysmgr/qt4/build/armv7
QMAKE=$LUNA_STAGING/usr/bin/qmake-palm
TOOLCHAIN=/home/dkirker/woce-build/toolchain/arm-2009q1
QMAKE_CXX=$TOOLCHAIN/bin/arm-none-linux-gnueabi-g++
QMAKE_CC=$TOOLCHAIN/bin/arm-none-linux-gnueabi-gcc
QMAKE_AR=$TOOLCHAIN/bin/arm-none-linux-gnueabi-ar
QMAKE_RANLIB=$TOOLCHAIN/bin/arm-none-linux-gnueabi-ranlib
QMAKE_STRIP=$TOOLCHAIN/bin/arm-none-linux-gnueabi-strip
QMAKE_LINK=$TOOLCHAIN/bin/arm-none-linux-gnueabi-g++
#export INCLUDEPATH=$LUNA_STAGING/usr/include/
INCLUDEPATH=$LUNA_STAGING/usr/include/glib-2.0/
export STAGING_INCDIR=$LUNA_STAGING/usr/include
export STAGING_LIBDIR=$LUNA_STAGING/usr/lib
export QTPATH=$QTDIR
export LD_LIBRARY_PATH=$QTDIR/lib:$LD_LIBRARY_PATH

export QMAKEPATH=./WebKit/Tools/qmake
export WEBKITOUTPUTDIR="WebKitBuild/isis-armv7"

./WebKit/Tools/Scripts/build-webkit --qt \
--release \
--video \
--fullscreen-api \
--no-webgl \
--no-webkit2 \
--qmake="${QMAKE}" \
--makeargs="-j$PROCOUNT" \
--qmakearg="-spec qws/linux-armv6-g++" \
--qmakearg="QMAKE_CC=$QMAKE_CC" \
--qmakearg="QMAKE_CXX=$QMAKE_CXX" \
--qmakearg="QMAKE_AR='$QMAKE_AR -r'" \
--qmakearg="QMAKE_LINK=$QMAKE_LINK" \
--qmakearg="QMAKE_RANLIB=$QMAKE_RANLIB" \
--qmakearg="QMAKE_STRIP=$QMAKE_STRIP" \
--qmakearg="STAGING_INCDIR=$STAGING_INCDIR" \
--qmakearg="DEFINES+=XP_UNIX" \
--qmakearg="DEFINES+=XP_WEBOS" \
--qmakearg="DEFINES+=PALM_DEVICE" \
--qmakearg="DEFINES+=QT_WEBOS" \
--qmakearg="DEFINES+=WTF_USE_ZLIB=1"
#--qmakearg="DEFINES+=WTF_USE_GSTREAMER=1" \
#--qmakearg="DEFINES+=ENABLE_GLIB_SUPPORT=1"
