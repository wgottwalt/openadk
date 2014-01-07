#!/bin/sh
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

os=$(uname)
ver=$(uname -r)
arch=$(uname -m)

linux() {
	echo "Preparing Linux for OpenADK is not implemented, yet"
	exit 1
}

darwin() {
	echo "Preparing MacOS X for OpenADK, is not implemented, yet"
	exit 1
}

openbsd() {
	echo "Preparing OpenBSD for OpenADK"
	PKG_PATH="ftp://ftp.openbsd.org/pub/OpenBSD/${ver}/packages/${arch}/"
	export PKG_PATH
	pkg_add -v gmake
	pkg_add -v rsync--
	pkg_add -v git
	pkg_add -v bash
	pkg_add -v unzip
	pkg_add -v wget
	pkg_add -v gtar--
	pkg_add -v gawk
	pkg_add -v gsed
	pkg_add -v xz
	pkg_add -v lzop
	pkg_add -v intltool
	pkg_add -v screen--
	pkg_add -v vim--no_x11
}

netbsd() {
	echo "Preparing NetBSD for OpenADK"
	PKG_PATH="ftp://ftp.netbsd.org/pub/pkgsrc/packages/NetBSD/${arch}/${ver}/All/"
	export PKG_PATH
	pkg_add -vu xz
	pkg_add -vu scmgit
	pkg_add -vu gmake
	pkg_add -vu bash
	pkg_add -vu wget
	pkg_add -vu unzip
	pkg_add -vu gtar
	pkg_add -vu gsed
	pkg_add -vu gawk
	pkg_add -vu intltool
	pkg_add -vu vim
	pkg_add -vu screen
	pkg_add -vu mksh
}

freebsd() {
	echo "Preparing FreeBSD for OpenADK"
	pkg_add -r git gmake bash wget unzip gtar gsed gawk intltool screen mksh vim
}

case $os in 
	Linux)
		linux
		;;
	FreeBSD)
		freebsd
		;;
	OpenBSD)
		openbsd
		;;
	NetBSD)
		netbsd
		;;
	Darwin)
		darwin
		;;
	*)
		echo "OS not supported"
		;;
esac
