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
	pkg_add -v bash
	pkg_add -v wget
	pkg_add -v gtar--
	pkg_add -v gawk
	pkg_add -v gsed
}

netbsd() {
	echo "Preparing NetBSD for OpenADK"
	PKG_PATH="ftp://ftp.netbsd.org/pub/pkgsrc/packages/NetBSD/${arch}/${ver}/All/"
	export PKG_PATH
	pkg_add -vu gmake
	pkg_add -vu bash
	pkg_add -vu wget
	pkg_add -vu gtar
	pkg_add -vu gsed
	pkg_add -vu gawk
}

freebsd() {
	echo "Preparing FreeBSD for OpenADK"
	pkg_add -r gmake bash wget gtar gsed gawk
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
