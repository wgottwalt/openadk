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

if [[ -n $ADK_PACKAGE_KODI ]]; then
	NEED_JAVA="$NEED_JAVA kodi"
fi

if [[ -n $ADK_PACKAGE_ICU4C ]]; then
	NEED_STATIC_LIBSTDCXX="$NEED_STATIC_LIBSTDCXX icu4c"
fi

if [[ -n $ADK_PACKAGE_XKEYBOARD_CONFIG ]]; then
	NEED_XKBCOMP="$NEED_XKBCOMP xkeyboard-config"
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

if [[ -n $NEED_STATIC_LIBSTDCXX ]]; then
cat >test.c <<-'EOF'
	#include <stdio.h>
	int
	main()
	{
		return (0);
	}
EOF
	if ! g++ -static-libstdc++ -o test test.c ; then
		echo >&2 You need static version of libstdc++ installed to build $NEED_STATIC_LIBSTDCXX
		out=1
		rm test 2>/dev/null
	fi
fi

exit $out
