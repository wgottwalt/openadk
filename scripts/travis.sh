#!/bin/bash

for system in $(grep "config ADK_TARGET" target/*/systems/*|awk -F: '{ print $1 }'); do
  system=$(echo $system|sed -e "s#ADK_TARGET_SYSTEM_##") 
  system=$(echo $system|tr '[:upper:]' '[:lower:]')
  arch=$(echo $system|awk -F/ '{ print $2 }')
  system=$(echo $system|awk -F/ '{ print $4 }')
  make ADK_TARGET_OS=Linux ADK_TARGET_ARCH=$arch ADK_TARGET_SYSTEM=$system ADK_APPLIANCE=new defconfig
  make
  make cleansystem
done
