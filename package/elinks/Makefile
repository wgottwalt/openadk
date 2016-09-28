# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		elinks
PKG_VERSION:=		0.11.7
PKG_RELEASE:=		3
PKG_HASH:=		94dc254cdecddee51819ae17962d9e606690bee3ec43fb43c635cb40197b4bc7
PKG_DESCR:=		advanced text web browser
PKG_SECTION:=		app/browser
PKG_URL:=		http://elinks.or.cz/
PKG_SITES:=		http://elinks.or.cz/download/

PKG_NOPARALLEL:=	1

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_FLAVOURS_ELINKS:=	WITH_IPV6
PKGFD_WITH_IPV6:=	enable IPv6 support

PKG_CHOICES_ELINKS:=	WITH_LIBRESSL WITHOUT_SSL
PKGCD_WITH_LIBRESSL:=	use libressl for crypto
PKGCB_WITH_LIBRESSL:=	libressl
PKGCS_WITH_LIBRESSL:=	libressl ca-certificates
PKGCD_WITHOUT_SSL:=	use no ssl

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,ELINKS,elinks,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

INSTALL_STYLE:=		manual
TARGET_CFLAGS+=		-fPIC
CONFIGURE_ENV+=		$(shell echo ac_cv_file_./features.conf | tr [:blank:]-/. _)=yes
CONFIGURE_ENV+=		$(shell echo ac_cv_file_${WRKBUILD}/features.conf | tr [:blank:]-/. _)=yes
CONFIGURE_ARGS+=	--enable-small \
			--enable-256-colors \
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
MAKE_FLAGS+=		CC='${TARGET_CC}'

ifneq (${ADK_PACKAGE_ELINKS_WITH_IPV6},)
CONFIGURE_ARGS+=	--enable-ipv6
else
CONFIGURE_ARGS+=	--disable-ipv6
endif

ifeq ($(ADK_PACKAGE_ELINKS_WITH_LIBRESSL),y)
CONFIGURE_ARGS+=	--with-openssl='${STAGING_TARGET_DIR}/usr'
endif
ifeq ($(ADK_PACKAGE_ELINKS_WITHOUT_SSL),y)
CONFIGURE_ARGS+=	--without-openssl
endif

do-install:
	${INSTALL_DIR} ${IDIR_ELINKS}/usr/bin
	${INSTALL_BIN} ${WRKBUILD}/src/elinks ${IDIR_ELINKS}/usr/bin/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
