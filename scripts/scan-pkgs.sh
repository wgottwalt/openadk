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
	if [[ -n $ADK_PACKAGE_NEON ]];then
		NEED_LIBXML2_DEV="$NEED_LIBXML2_DEV neon"
	fi
	if [[ -n $ADK_PACKAGE_LZOP ]];then
		NEED_LZODEV="$NEED_LZODEV lzop"
	fi
	if [[ -n $ADK_PACKAGE_LIBIMAGEMAGICK ]];then
		NEED_JPEGDEV="$NEED_JPEGDEV libimagemagick"
		NEED_TIFFDEV="$NEED_TIFFDEV libimagemagick"
	fi
	if [[ -n $ADK_PACKAGE_DISPLAY ]];then
		NEED_X11DEV="$NEED_X11DEV display"
		NEED_XEXTDEV="$NEED_XEXTDEV display"
	fi
	if [[ -n $ADK_PACKAGE_GIT ]];then
		NEED_CURLDEV="$NEED_CURLDEV git"
	fi
	if [[ -n $ADK_TARGET_PACKAGE_RPM ]]; then
		NEED_RPM="$NEED_RPM rpm"
	fi
	if [[ -n $ADK_PACKAGE_WPA_SUPPLICANT_WITH_OPENSSL ]]; then
		NEED_LIBSSLDEV="$NEED_LIBSSLDEV wpa_supplicant"
	fi
	if [[ -n $ADK_COMPILE_BIND ]]; then
		NEED_LIBSSLDEV="$NEED_LIBSSLDEV bind"
	fi
	if [[ -n $ADK_PACKAGE_IW ]]; then
		NEED_LIBNLDEV="$NEED_LIBNLDEV iw"
	fi
	if [[ -n $ADK_PACKAGE_NFS_UTILS_WITH_KERBEROS ]]; then
		NEED_LIBKRB5DEV="$NEED_LIBKRB5DEV nfs-utils"
	fi
	if [[ -n $ADK_PACKAGE_NFS_UTILS_WITH_TIRPC ]]; then
		NEED_LIBTIRPCDEV="$NEED_LIBTIRPCDEV nfs-utils"
	fi
fi

if [[ -n $ADK_PACKAGE_LIBX11 ]]; then
	NEED_X11="$NEED_X11 libx11"
fi

if [[ -n $ADK_PACKAGE_LIBNL ]]; then
	NEED_FLEX="$NEED_FLEX libnl"
fi

if [[ -n $ADK_PACKAGE_GPSD ]]; then
	NEED_PYTHON="$NEED_PYTHON gpsd"
fi

if [[ -n $ADK_PACKAGE_FIREFOX ]]; then
	NEED_YASM="$NEED_YASM firefox"
	NEED_LIBIDL="$NEED_LIBIDL firefox"
	NEED_PYTHON="$NEED_PYTHON firefox"
	NEED_ZIP="$NEED_ZIP firefox"
fi

if [[ -n $ADK_PACKAGE_MESALIB ]]; then
	NEED_MAKEDEPEND="$NEED_MAKEDEPEND mesalib"
fi

if [[ -n $ADK_COMPILE_HEIMDAL ]]; then
	NEED_BISON="$NEED_BISON heimdal-server"
fi

if [[ -n $ADK_COMPILE_KRB5 ]]; then
	NEED_BISON="$NEED_BISON krb5"
fi

if [[ -n $ADK_COMPILE_OPENJDK ]]; then
	NEED_ZIP="$NEED_ZIP openjdk"
	NEED_GXX="$NEED_GXX openjdk"
	NEED_XSLTPROC="$NEED_XSLTPROC openjdk"
fi

if [[ -n $ADK_COMPILE_OPENJDK ]]; then
	cd ${TOPDIR}/jtools; bash prereq.sh
	[ $? -ne 0 ] && out=1
fi

if [[ -n $ADK_COMPILE_OPENJDK7 ]]; then
	NEED_ZIP="$NEED_ZIP openjdk"
fi

if [[ -n $ADK_COMPILE_OPENJDK7 ]]; then
	cd ${TOPDIR}/jtools; bash prereq.sh
	[ $? -ne 0 ] && out=1
fi

if [[ -n $ADK_PACKAGE_LIBXCB ]]; then
	NEED_XSLTPROC="$NEED_XSLTPROC libxcb"
fi

if [[ -n $ADK_COMPILE_PCMCIAUTILS ]]; then
	NEED_BISON="$NEED_BISON pcmciautils"
	NEED_FLEX="$NEED_FLEX pcmciautils"
fi

if [[ -n $ADK_PACKAGE_XKEYBOARD_CONFIG ]]; then
	NEED_XKBCOMP="$NEED_XKBCOMP xkeyboard-config"
fi

if [[ -n $ADK_COMPILE_AUTOCONF ]]; then
	NEED_M4="$NEED_M4 autoconf"
fi

if [[ -n $ADK_COMPILE_AUTOMAKE ]]; then
	NEED_AUTOCONF="$NEED_AUTOCONF automake"
fi

if [[ -n $ADK_COMPILE_LIBTOOL ]]; then
	NEED_AUTOMAKE="$NEED_AUTOMAKE libtool"
fi

if [[ -n $ADK_PACKAGE_SQUID ]]; then
	NEED_GXX="$NEED_GXX squid"
fi

if [[ -n $ADK_PACKAGE_XKEYBOARD_CONFIG ]]; then
	NEED_INTL="$NEED_INTL xkeyboard-config"
fi

if [[ -n $ADK_PACKAGE_LIBPCAP ]]; then
	NEED_FLEX="$NEED_FLEX libpcap"
	NEED_BISON="$NEED_BISON libpcap"
fi

if [[ -n $ADK_PACKAGE_LIBXFONT ]]; then
	NEED_WWW="$NEED_WWW libXfont"
	NEED_XMLTO="$NEED_XMLTO libXfont"
fi

if [[ -n $ADK_PACKAGE_PACEMAKER_MGMTD ]]; then
	NEED_SWIG="$NEED_SWIG pacemaker-mgmtd"
fi

if [[ -n $ADK_PACKAGE_EGLIBC ]]; then
	NEED_GPERF="$NEED_GPERF eglibc"
fi

if [[ -n $ADK_PACKAGE_GLIB ]]; then
	NEED_GETTEXT="$NEED_GETTEXT glib"
fi

if [[ -n $ADK_PACKAGE_YAJL ]]; then
	NEED_RUBY="$NEED_RUBY yajl"
	NEED_CMAKE="$NEED_CMAKE yajl"
fi

if [[ -n $ADK_PACKAGE_XBMC ]]; then
	NEED_SDLDEV="$NEED_SDLDEV xbmc"
	NEED_SDLIMAGEDEV="$NEED_SDLIMAGEDEV xbmc"
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

if [[ -n $NEED_GETTEXT ]]; then
	if ! which gettext >/dev/null 2>&1; then
		echo >&2 You need gettext to build $NEED_GETTEXT
		out=1
	elif ! which msgfmt >/dev/null 2>&1; then
		echo >&2 You need msgfmt to build $NEED_GETTEXT
		out=1
	fi
fi

if [[ -n $NEED_LIBTIRPCDEV ]];then
	if ! test -f /usr/include/tirpc/netconfig.h >/dev/null; then
		echo >&2 You need tirpc headers to build $NEED_LIBTIRPCDEV
		out=1
	fi
fi

if [[ -n $NEED_LIBXML2_DEV ]];then
	if ! test -f /usr/include/libxml2/libxml/xmlversion.h >/dev/null; then
		echo >&2 You need libxml2 headers to build $NEED_LIBXML2_DEV
		out=1
	fi
fi

if [[ -n $NEED_LIBKRB5DEV ]];then
	if ! test -f /usr/include/krb5.h >/dev/null; then
		echo >&2 You need krb5 headers to build $NEED_LIBKRB5DEV
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

if [[ -n $NEED_TIFFDEV ]];then
	if ! test -f /usr/include/tiff.h >/dev/null; then
		echo >&2 You need libtiff headers to build $NEED_TIFFDEV
		out=1
	fi
fi

if [[ -n $NEED_SDLDEV ]];then
	if ! test -f /usr/include/SDL/SDL.h >/dev/null; then
		echo >&2 You need libSDL headers to build $NEED_SDLDEV
		out=1
	fi
fi

if [[ -n $NEED_SDLIMAGEDEV ]];then
	if ! test -f /usr/include/SDL/SDL_image.h >/dev/null; then
		echo >&2 You need libSDL-image headers to build $NEED_SDLIMAGEDEV
		out=1
	fi
fi

if [[ -n $NEED_JPEGDEV ]];then
	if ! test -f /usr/include/jpeglib.h >/dev/null; then
		echo >&2 You need libjpeg headers to build $NEED_JPEGDEV
		out=1
	fi
fi

if [[ -n $NEED_LZODEV ]];then
	if ! test -f /usr/include/lzo/lzo1.h >/dev/null; then
		echo >&2 You need liblzo headers to build $NEED_LZODEV
		out=1
	fi
fi

if [[ -n $NEED_LIBNLDEV ]];then
	if ! test -f /usr/include/netlink/netlink.h >/dev/null; then
		echo >&2 You need libnl headers to build $NEED_LIBNLDEV
		out=1
	fi
fi

if [[ -n $NEED_X11DEV ]];then
	if ! test -f /usr/include/X11/Xlib.h >/dev/null; then
		echo >&2 You need X11 headers to build $NEED_X11DEV
		out=1
	fi
fi

if [[ -n $NEED_X11 ]];then
	if ! test -f /usr/include/X11/X.h >/dev/null; then
	  if ! test -f /usr/local/include/X11/X.h >/dev/null; then
		echo >&2 You need X11 headers to build $NEED_X11
		out=1
	  fi
	fi
fi

if [[ -n $NEED_XEXTDEV ]];then
	if ! test -f /usr/include/X11/extensions/XShm.h >/dev/null; then
		echo >&2 You need X11 extensions headers to build $NEED_XEXTDEV
		out=1
	fi
fi

if [[ -n $NEED_LIBSSLDEV ]]; then
	if ! test -f /usr/include/openssl/ssl.h >/dev/null; then
		echo >&2 You need openssl headers to build $NEED_LIBSSLDEV
		out=1
	fi
fi

if [[ -n $NEED_MKFONTDIR ]]; then
	if ! which mkfontdir >/dev/null 2>&1; then
		echo >&2 You need mkfontdir to build $NEED_MKFONTDIR
		out=1
	fi
fi

if [[ -n $NEED_M4 ]]; then
	if ! which m4 >/dev/null 2>&1; then
		echo >&2 You need GNU m4 to build $NEED_M4
		out=1
	fi
fi

if [[ -n $NEED_AUTOCONF ]]; then
	if ! which autoconf >/dev/null 2>&1; then
		echo >&2 You need autoconf to build $NEED_AUTOCONF
		out=1
	fi
fi

if [[ -n $NEED_AUTOMAKE ]]; then
	if ! which automake >/dev/null 2>&1; then
		echo >&2 You need automake to build $NEED_AUTOMAKE
		out=1
	fi
fi

if [[ -n $NEED_INTL ]]; then
	if ! which intltool-update >/dev/null 2>&1; then
		echo >&2 You need intltool to build $NEED_INTL
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

if [[ -n $NEED_CMAKE ]]; then
	if ! which cmake >/dev/null 2>&1; then
		echo >&2 You need cmake to build $NEED_CMAKE
		out=1
	fi
fi

if [[ -n $NEED_ZIP ]]; then
	if ! which zip >/dev/null 2>&1; then
		echo >&2 You need zip to build $NEED_ZIP
		out=1
	fi
fi

if [[ -n $NEED_LIBIDL ]]; then
	if ! which libIDL-config-2 >/dev/null 2>&1; then
		echo >&2 You need libIDL-config-2 to build $NEED_LIBIDL
		out=1
	fi
fi

if [[ -n $NEED_SWIG ]]; then
	if ! which swig >/dev/null 2>&1; then
		echo >&2 You need swig to build $NEED_SWIG
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

if [[ -n $NEED_RPM ]]; then
	if ! which rpmbuild >/dev/null 2>&1; then
		echo >&2 You need rpmbuild to to use $NEED_RPM package backend
		out=1
	fi
fi

if [[ -n $NEED_FLEX ]]; then
	if ! which flex >/dev/null 2>&1; then
		echo >&2 You need flex to build $NEED_FLEX
		out=1
	fi
fi

if [[ -n $NEED_YASM ]]; then
	if ! which yasm >/dev/null 2>&1; then
		echo >&2 You need yasm to build $NEED_YASM
		out=1
	fi
fi

if [[ -n $NEED_XSLTPROC ]]; then
	if ! which xsltproc >/dev/null 2>&1; then
		echo >&2 You need xsltproc to build $NEED_XSLTPROC
		out=1
	fi
fi

if [[ -n $NEED_DBUSGLIB ]]; then
	if ! which dbus-binding-tool >/dev/null 2>&1; then
		echo >&2 You need dbus-binding-tool to build $NEED_DBUSGLIB
		out=1
	fi
fi

if [[ -n $NEED_PYTHON ]]; then
	if ! which python >/dev/null 2>&1; then
		if ! test -x /usr/pkg/bin/python2.6 >/dev/null; then
			echo >&2 You need python to build $NEED_PYTHON
			out=1
		fi
	fi
fi

if [[ -n $NEED_MAKEDEPEND ]]; then
	if ! which makedepend >/dev/null 2>&1; then
		echo >&2 You need makedepend to build $NEED_MAKEDEPEND
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
