# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		elinks
PKG_VERSION:=		0.11.3
PKG_RELEASE:=		1
PKG_MD5SUM:=		11547e054d7afb1f5ac9e9f65728cc6a
MASTER_SITES:=		http://elinks.or.cz/download/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,ELINKS,elinks,${PKG_VERSION}-${PKG_RELEASE}))

CONFIGURE_STYLE:=	gnu
CONFIGURE_ENV+=		$(shell echo ac_cv_file_./features.conf | tr [:blank:]-/. _)=yes
CONFIGURE_ENV+=		$(shell echo ac_cv_file_${WRKBUILD}/features.conf | tr [:blank:]-/. _)=yes
CONFIGURE_ARGS+=	--enable-small \
			--enable-256-colors \
			--with-openssl='${STAGING_DIR}/usr' \
			--disable-backtrace \
			--disable-data \
			--disable-formhist \
			--disable-leds \
			--disable-mailcap \
			--disable-mouse \
			--disable-smb \
			--disable-uri-rewrite \
			--disable-xbel \
			--without-bzlib \
			--without-gpm \
			--without-idn \
			--without-gnutls \
			--without-libiconv \
			--without-lua \
			--without-spidermonkey \
			--without-x \
			--without-zlib
BUILD_STYLE:=		auto
MAKE_FLAGS+=		CC='${TARGET_CC}' LD='${TARGET_CROSS}ld'

do-install:
	${INSTALL_DIR} ${IDIR_ELINKS}/usr/bin
	${INSTALL_BIN} ${WRKBUILD}/src/elinks ${IDIR_ELINKS}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
