#!/bin/bash

cd $1
for i in $(find . -name Config.in);
do
 cp --parents $i ../package/busybox/config/
done
cd ..
cd package/busybox/config
for i in $(find . -name Config.in);
do
 sed -i -e 's/^mainmenu \(.*\)/# mainmenu \1/' $i
 sed -i -e 's/^config \(.*\)/config BUSYBOX_\1/' $i
 sed -i -e 's/^	select \([:upper:]*\)/	select BUSYBOX_\1/' $i
 sed -i -e 's/depends on !\([:upper:]*\)/depends on !BUSYBOX_\1/' $i
 sed -i -e 's/depends on (\([:upper:]*\)/depends on (BUSYBOX_\1/' $i
 sed -i -e 's/depends on \([^!(][:upper:]*\)/depends on BUSYBOX_\1/' $i
 sed -i -e 's/&& (\([:upper:]*\)/\&\& (BUSYBOX_\1/' $i
 sed -i -e 's/&& !\([:upper:]*\)/\&\& !BUSYBOX_\1/g' $i
 sed -i -e 's/&& \([^!(][:upper:]*\)/\&\& BUSYBOX_\1/g' $i
 sed -i -e 's/|| !\([:upper:]*\)/|| !BUSYBOX_\1/g' $i
 sed -i -e 's/|| \([^!(][:upper:]*\)/|| BUSYBOX_\1/g' $i
 sed -i -e 's#^source \(.*\)#source package/busybox/config/\1#' $i
 sed -i -e 's/BUSYBOX_ \([:upper:]*\)/BUSYBOX_\1/' $i
done
