# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		elinks
PKG_VERSION:=		0.11.7
PKG_RELEASE:=		3
PKG_MD5SUM:=		145c510cae41c204d0f23dce4bdd23ab
PKG_DESCR:=		advanced text web browser
PKG_SECTION:=		browser
PKG_DEPENDS:=		libopenssl
PKG_BUILDDEP+=		openssl
PKG_URL:=		http://elinks.or.cz/
PKG_SITES:=		http://elinks.or.cz/download/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,ELINKS,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

INSTALL_STYLE:=		manual

TCFLAGS+=		-fPIC
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
MAKE_FLAGS+=		CC='${TARGET_CC}'

do-install:
	${INSTALL_DIR} ${IDIR_ELINKS}/usr/bin
	${INSTALL_BIN} ${WRKBUILD}/src/elinks ${IDIR_ELINKS}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
