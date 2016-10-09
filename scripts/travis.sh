#!/bin/bash
arch=$1
system=$2
make ADK_TARGET_OS=Linux ADK_TARGET_ARCH=$arch ADK_TARGET_SYSTEM=$system ADK_APPLIANCE=new defconfig
make
