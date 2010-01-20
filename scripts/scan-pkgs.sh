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

if [[ -n $ADK_NATIVE ]];then
	if [[ -n $ADK_PACKAGE_GIT ]];then
		NEED_CURLDEV="$NEED_CURLDEV git"
		NEED_SSLDEV="$NEED_SSLDEV git"
	fi
	if [[ -n $ADK_TARGET_PACKAGE_RPM ]]; then
		NEED_RPM="$NEED_RPM rpm"
	fi
fi

if [[ -n $ADK_PACKAGE_RUBY ]]; then
	NEED_RUBY="$NEED_RUBY ruby"
fi

if [[ -n $ADK_PACKAGE_LIBUSB ]]; then
	NEED_BISON="$NEED_BISON libusb"
fi

if [[ -n $ADK_COMPILE_HEIMDAL ]]; then
	NEED_BISON="$NEED_BISON heimdal-server"
fi

if [[ -n $ADK_PACKAGE_XKEYBOARD_CONFIG ]]; then
	NEED_XKBCOMP="$NEED_XKBCOMP xkeyboard-config"
fi

if [[ -n $ADK_COMPILE_AVAHI ]]; then
	NEED_PKGCONFIG="$NEED_PKGCONFIG avahi"
fi

if [[ -n $ADK_PACKAGE_SQUID ]]; then
	NEED_SSLDEV="$NEED_SSLDEV squid"
	NEED_GXX="$NEED_GXX squid"
fi

if [[ -n $ADK_PACKAGE_DANSGUARDIAN ]]; then
	NEED_PKGCONFIG="$NEED_PKGCONFIG dansguardian"
fi

if [[ -n $ADK_PACKAGE_XKEYBOARD_CONFIG ]]; then
	NEED_INTL="$NEED_INTL xkeyboard-config"
fi

if [[ -n $ADK_PACKAGE_GLIB ]]; then
	NEED_GLIBZWO="$NEED_GLIBZWO glib"
	NEED_GETTEXT="$NEED_GETTEXT glib"
	NEED_PKGCONFIG="$NEED_PKGCONFIG glib"
fi

if [[ -n $ADK_PACKAGE_LIBPCAP ]]; then
	NEED_FLEX="$NEED_FLEX libpcap"
	NEED_BISON="$NEED_BISON libpcap"
fi

if [[ -n $ADK_PACKAGE_LIBXFONT ]]; then
	NEED_WWW="$NEED_WWW libXfont"
	NEED_XMLTO="$NEED_XMLTO libXfont"
fi

if [[ -n $ADK_PACKAGE_EGLIBC ]]; then
	NEED_GPERF="$NEED_GPERF eglibc"
fi

if [[ -n $NEED_GETTEXT ]]; then
	if ! which xgettext >/dev/null 2>&1; then
		echo >&2 You need gettext to build $NEED_GETTEXT
		out=1
	elif ! which msgfmt >/dev/null 2>&1; then
		echo >&2 You need gettext to build $NEED_GETTEXT
		out=1
	fi
fi

if [[ -n $NEED_CURLDEV ]];then
	if ! test -f /usr/include/curl/curl.h >/dev/null; then
		if ! test -f /usr/local/include/curl/curl.h >/dev/null; then
			echo >&2 You need curl headers to build $NEED_CURLDEV
			out=1
		fi
	fi
fi

if [[ -n $NEED_SSLDEV ]]; then
	if ! test -f /usr/lib/pkgconfig/openssl.pc >/dev/null; then
		if ! test -f /usr/include/openssl/ssl.h >/dev/null; then
			echo >&2 You need openssl headers to build $NEED_SQUID
			out=1
		fi
	fi
fi

if [[ -n $NEED_INTL ]]; then
	if ! which intltool-update >/dev/null 2>&1; then
		echo >&2 You need intltool-update to build $NEED_INTL
		out=1
	fi
fi

if [[ -n $NEED_WWW ]]; then
	if ! which w3m >/dev/null 2>&1; then
		if ! which lynx >/dev/null 2>&1; then
			if ! which links >/dev/null 2>&1; then
				echo >&2 You need w3m/links/lynx to build $NEED_WWW
				out=1
			fi
		fi
	fi
fi

if [[ -n $NEED_BISON ]]; then
	if ! which bison >/dev/null 2>&1; then
		echo >&2 You need bison to build $NEED_BISON
		out=1
	fi
fi

if [[ -n $NEED_GPERF ]]; then
	if ! which gperf >/dev/null 2>&1; then
		echo >&2 You need gperf to build $NEED_GPERF
		out=1
	fi
fi

if [[ -n $NEED_GXX ]]; then
	if ! which g++ >/dev/null 2>&1; then
		echo >&2 You need GNU c++ compiler to build $NEED_GXX
		out=1
	fi
fi

if [[ -n $NEED_RUBY ]]; then
	if ! which ruby >/dev/null 2>&1; then
		echo >&2 You need ruby to build $NEED_RUBY
		out=1
	fi
fi

if [[ -n $NEED_XKBCOMP ]]; then
	if ! which xkbcomp >/dev/null 2>&1; then
		echo >&2 You need xkbcomp to build $NEED_XKBCOMP
		out=1
	fi
fi

if [[ -n $NEED_PKGCONFIG ]]; then
	if ! which pkg-config >/dev/null 2>&1; then
		echo >&2 You need pkg-config to build $NEED_PKGCONFIG
		out=1
	fi
fi

if [[ -n $NEED_GLIBZWO ]]; then
	if ! which glib-genmarshal >/dev/null 2>&1; then
		echo >&2 You need libglib2.0-dev to build $NEED_GLIBZWO
		out=1
	fi
fi

if [[ -n $ADK_USE_CCACHE ]]; then
        if ! which ccache >/dev/null 2>&1; then
                echo >&2 You have selected to build with ccache, but ccache could not be found.
                out=1
        fi
fi

if [[ -n $NEED_RPM ]]; then
	if ! which rpmbuild >/dev/null 2>&1; then
		echo >&2 You need rpmbuild to to use $NEED_RPM package backend
		out=1
	fi
fi

if [[ -n $NEED_FLEX ]]; then
	if ! which flex >/dev/null 2>&1; then
		echo >&2 You need flex to to use $NEED_FLEX package
		out=1
	fi
fi

exit $out
