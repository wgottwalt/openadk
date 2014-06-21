#!/usr/bin/env bash
# execute this after relocation of adk directory

olddir=$(grep "^ADK_TOPDIR" prereq.mk 2>/dev/null |cut -d '=' -f 2)
newdir=$(pwd)

if [ ! -z "$olddir" ];then
  if [ "$olddir" != "$newdir" ];then
	echo "adk directory relocated!"
	echo "old directory: $olddir"
	echo "new directory: $newdir"
	sed -i -e "s#$olddir#$newdir#g" $(find target_* -name \*.pc|xargs)
	sed -i -e "s#$olddir#$newdir#g" $(find target_* -name \*.la|xargs)
	sed -i -e "s#$olddir#$newdir#g" $(find target_*/scripts -type f|xargs)
	sed -i -e "s#$olddir#$newdir#" target_*/etc/ipkg.conf
	sed -i -e "s#$olddir#$newdir#" prereq.mk
  fi
fi
