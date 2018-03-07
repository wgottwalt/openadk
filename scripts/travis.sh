#!/bin/bash
os=$1
arch=$2
system=$3
vars="ADK_TARGET_OS=$os ADK_TARGET_ARCH=$arch ADK_TARGET_SYSTEM=$system ADK_APPLIANCE=new"
if [ ! -z $4 ]; then
 endian=$4
 vars="$vars ADK_TARGET_ENDIAN=$endian"
fi
make $vars defconfig
make
