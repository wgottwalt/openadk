# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.
#
# Scan host-tool prerequisites of certain packages before building.

if test -z "$BASH_VERSION"; then
	foo=`$BASH -c 'echo "$BASH_VERSION"'`
else
	foo=$BASH_VERSION
fi

if test -z "$foo"; then
	echo OpenADK requires GNU bash to be installed.
	exit 1
fi

test -z "$BASH_VERSION$KSH_VERSION" && exec $BASH $0 "$@"

[[ -n $BASH_VERSION ]] && shopt -s extglob
topdir=$(readlink -nf $(dirname $0)/.. 2>/dev/null || (cd $(dirname $0)/..; pwd -P))
OStype=$(uname)
out=0

. $topdir/.config

if [[ -n $ADK_PACKAGE_XBMC ]]; then
	NEED_JAVA="$NEED_JAVA xbmc"
fi

if [[ -n $ADK_PACKAGE_XKEYBOARD_CONFIG ]]; then
	NEED_XKBCOMP="$NEED_XKBCOMP xkeyboard-config"
fi

if [[ -n $ADK_COMPILE_COROSYNC ]]; then
	NEED_GROFF="$NEED_GROFF corosync"
fi

if [[ -n $ADK_PACKAGE_LIBXFONT ]]; then
	NEED_XMLTO="$NEED_XMLTO libXfont"
fi

if [[ -n $ADK_PACKAGE_FONT_BITSTREAM_100DPI ]]; then
	NEED_MKFONTDIR="$NEED_MKFONTDIR font-bitstream-100dpi"
fi

if [[ -n $ADK_PACKAGE_FONT_BITSTREAM_75DPI ]]; then
	NEED_MKFONTDIR="$NEED_MKFONTDIR font-bitstream-75dpi"
fi

if [[ -n $ADK_PACKAGE_FONT_ADOBE_100DPI ]]; then
	NEED_MKFONTDIR="$NEED_MKFONTDIR font-adobe-100dpi"
fi

if [[ -n $ADK_PACKAGE_FONT_ADOBE_75DPI ]]; then
	NEED_MKFONTDIR="$NEED_MKFONTDIR font-adobe-75dpi"
fi

if [[ -n $NEED_GROFF ]]; then
	if ! which groff >/dev/null 2>&1; then
		echo >&2 You need groff to build $NEED_GROFF
		out=1
	fi
fi

if [[ -n $NEED_MKFONTDIR ]]; then
	if ! which mkfontdir >/dev/null 2>&1; then
		echo >&2 You need mkfontdir to build $NEED_MKFONTDIR
		out=1
	fi
fi

if [[ -n $NEED_XKBCOMP ]]; then
	if ! which xkbcomp >/dev/null 2>&1; then
		echo >&2 You need xkbcomp to build $NEED_XKBCOMP
		out=1
	fi
fi

if [[ -n $NEED_JAVA ]]; then
	if ! which java >/dev/null 2>&1; then
		echo >&2 You need java to build $NEED_JAVA
		out=1
	fi
fi

if [[ -n $ADK_USE_CCACHE ]]; then
        if ! which ccache >/dev/null 2>&1; then
                echo >&2 You have selected to build with ccache, but ccache could not be found.
                out=1
        fi
fi

exit $out
