#!/bin/sh
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

os=$(uname)
ver=$(uname -r)
arch=$(uname -m)

ext=0
while getopts "el" option
do
	case $option in
		e) ext=1 ;;
		l) lux=1 ;;
		*) printf "Option not recognized\n";exit 1 ;;
	esac
done
shift $(($OPTIND - 1))

linux() {
	echo "Preparing Linux for OpenADK"
}

darwin() {
	echo "Preparing MacOS X for OpenADK"
}

openbsd() {
	echo "Preparing OpenBSD for OpenADK"
	PKG_PATH="ftp://ftp.openbsd.org/pub/OpenBSD/${ver}/packages/${arch}/"
	export PKG_PATH
	pkg_add -v gmake
	pkg_add -v git
	pkg_add -v bash
	pkg_add -v unzip
	pkg_add -v wget
	pkg_add -v gtar--
	pkg_add -v gawk
	pkg_add -v gsed
	pkg_add -v xz
}

openbsd_full() {
	PKG_PATH="ftp://ftp.openbsd.org/pub/OpenBSD/${ver}/packages/${arch}/"
	export PKG_PATH
	pkg_add -v zip
	pkg_add -v intltool
	pkg_add -v libIDL
	pkg_add -v m4
	pkg_add -v gperf
}

openbsd_lux() {
	PKG_PATH="ftp://ftp.openbsd.org/pub/OpenBSD/${ver}/packages/${arch}/"
	export PKG_PATH
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
	pkg_add -vu pkg-config
	pkg_add -vu unzip
	pkg_add -vu gtar
	pkg_add -vu gsed
	pkg_add -vu gawk
	pkg_add -vu gperf
}

netbsd_full() {
	echo "Preparing NetBSD for full OpenADK package builds"
	PKG_PATH="ftp://ftp.netbsd.org/pub/pkgsrc/packages/NetBSD/${arch}/${ver}/All/"
	export PKG_PATH
	pkg_add -vu intltool
	pkg_add -vu lynx
	pkg_add -vu zip
	pkg_add -vu libIDL
	pkg_add -vu xkbcomp
}

netbsd_lux() {
	echo "Preparing NetBSD for deluxe OpenADK package builds"
	PKG_PATH="ftp://ftp.netbsd.org/pub/pkgsrc/packages/NetBSD/${arch}/${ver}/All/"
	export PKG_PATH
	pkg_add -vu vim
	pkg_add -vu screen
	pkg_add -vu mksh
}

freebsd() {
	echo "Preparing FreeBSD for OpenADK"
	pkg_add -r git gmake bash wget unzip gtar gsed gawk gperf
}

freebsd_full() {
	echo "Preparing FreeBSD for full OpenADK package builds"
	pkg_add -r intltool lynx zip xkbcomp glib20 libIDL libxslt swig
}

freebsd_lux() {
	echo "Preparing FreeBSD for deluxe OpenADK package builds"
	pkg_add -r screen mksh vim
}

case $os in 
	Linux)
		linux
		[ $ext -eq 1 ] && linux_full
		;;
	FreeBSD)
		freebsd
		[ $ext -eq 1 ] && freebsd_full
		[ $lux -eq 1 ] && freebsd_lux
		;;
	OpenBSD)
		openbsd
		[ $ext -eq 1 ] && openbsd_full
		[ $lux -eq 1 ] && openbsd_lux
		;;
	NetBSD)
		netbsd
		[ $ext -eq 1 ] && netbsd_full
		[ $lux -eq 1 ] && netbsd_lux
		;;
	Darwin)
		darwin
		[ $ext -eq 1 ] && darwin_full
		;;
	*)
		echo "OS not supported"
		;;
esac
