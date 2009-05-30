# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME=		lynx
PKG_VERSION=		2.8.7dev.7
PKG_RELEASE=		1
PKG_MD5SUM=		83891107c873421e5ac917cc0ab53fe8
PKG_DESCR:=		Standard text browser
PKG_SECTION:=		text
PKG_DEPENDS:=		libncurses libopenssl
PKG_URL:=		http://lynx.isc.org
PKG_SITES=		http://lynx.isc.org/current/ \
			${MASTER_SITE_MIRBSD}

DISTFILES=		${PKG_NAME}${PKG_VERSION}.tar.gz
WRKDIST=		${WRKDIR}/lynx2-8-7

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LYNX,lynx,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE=	gnu
TCPPFLAGS+=		-DLYNX_VERSION=\"${PKG_VERSION}-${PKG_RELEASE}\"
# do not hardcode paths; do not scan for ports stuff
CONFIGURE_ENV+=		ac_cv_path_TELNET=telnet \
			ac_cv_path_TN3270=tn3270 \
			ac_cv_path_RLOGIN=rlogin \
			ac_cv_path_MV=mv \
			ac_cv_path_GZIP=gzip \
			ac_cv_path_UNCOMPRESS=gunzip \
			ac_cv_path_UNZIP=unzip \
			ac_cv_path_BZIP2=bzip2 \
			ac_cv_path_TAR=tar \
			ac_cv_path_COMPRESS=compress \
			ac_cv_path_RM=rm \
			ac_cv_path_UUDECODE=uudecode \
			ac_cv_path_ZCAT=zcat \
			ac_cv_path_ZIP=zip
# from MirPorts Framework
CONFIGURE_ARGS+=	--enable-vertrace \
			--enable-warnings \
			--disable-nls \
			--disable-full-paths \
			--with-ssl=/usr \
			--without-gnutls \
			--without-socks \
			--without-socks5 \
			--with-screen=ncursesw \
			--enable-widec \
			--enable-addrlist-page \
			--enable-charset-choice \
			--enable-cjk \
			--enable-japanese-utf8 \
			--enable-color-style \
			--disable-default-colors \
			--disable-htmlized-cfg \
			--enable-ipv6 \
			--enable-kbd-layout \
			--enable-locale-charset \
			--enable-nested-tables \
			--disable-scrollbar \
			--enable-justify-elts \
			--enable-internal-links \
			--enable-nsl-fork \
			--enable-underlines \
			--without-bzlib \
			--with-zlib \
			--without-x
# local stuff
CONFIGURE_ARGS+=	--with-ssl=${STAGING_DIR}/usr \
			--disable-full-paths \
			--with-cfg-file=/etc/lynx.cfg \
			--with-lss-file=/etc/lynx.lss \
			--disable-font-switch
TCPPFLAGS+=		-I${STAGING_DIR}/include/openssl
TCPPFLAGS+=		-DUSE_OPENSSL_INCL -DUSE_X509_SUPPORT
# needs libiconv
CONFIGURE_ARGS+=	--disable-japanese-utf8
# shrink size
CONFIGURE_ARGS+=	--disable-vertrace \
			--disable-trace \
			--disable-cjk \
			--disable-kbd-layout \
			--disable-prettysrc \
			--disable-finger \
			--disable-dired
ifeq (${ADK_UNICODE},)
CONFIGURE_ARGS+=	--with-screen=ncurses \
			--disable-widec \
			--disable-locale-charset
endif
ifneq (${ADK_IPV6},y)
CONFIGURE_ARGS+=	--disable-ipv6
endif
MAKE_FILE=		makefile
BUILD_STYLE=		auto
INSTALL_STYLE=		auto

post-install:
	${INSTALL_DIR} ${IDIR_LYNX}/etc ${IDIR_LYNX}/usr/bin
	${CP} ${WRKINST}/etc/lynx.{cfg,lss} ${IDIR_LYNX}/etc
	${CP} ${WRKINST}/usr/bin/lynx ${IDIR_LYNX}/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
