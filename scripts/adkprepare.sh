#!/bin/sh

while getopts "e" option
do
	case $option in
		e) ext=1 ;;
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
}

netbsd() {
	echo "Preparing NetBSD for OpenADK"
}

freebsd() {
	echo "Preparing FreeBSD for OpenADK"
	pkg_add -r git gmake mksh bash wget unzip gtar gsed gawk
}

freebsd_full() {
	echo "Preparing FreeBSD for full OpenADK package builds"
	pkg_add -r intltool lynx bison zip xkbcomp glib20 libIDL
}

os=$(uname)

case $os in 
	Linux)
		linux
		[[ $ext -eq 1 ]] && linux_full
		;;
	FreeBSD)
		freebsd
		[[ $ext -eq 1 ]] && freebsd_full
		;;
	OpenBSD)
		openbsd
		[[ $ext -eq 1 ]] && openbsd_full
		;;
	NetBSD)
		netbsd
		[[ $ext -eq 1 ]] && netbsd_full
		;;
	Darwin)
		darwin
		[[ $ext -eq 1 ]] && darwin_full
		;;	
esac

