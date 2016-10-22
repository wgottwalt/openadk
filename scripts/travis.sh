#!/bin/bash
arch=$1
system=$2
vars="ADK_TARGET_OS=Linux ADK_TARGET_ARCH=$arch ADK_TARGET_SYSTEM=$system ADK_APPLIANCE=new"
if [ ! -z $3 ]; then
 endian=$3
 vars="$vars ADK_TARGET_ENDIAN=$endian"
fi
make $vars defconfig
make
