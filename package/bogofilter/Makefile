# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		bogofilter
PKG_VERSION:=		1.2.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		4bbc9adc30d4f8e3a547f9be18a1cb74
PKG_DESCR:=		mail filter
PKG_SECTION:=		mail
PKG_DEPENDS:=		libiconv libdb
PKG_BUILDDEP+=		libiconv libdb
PKG_URL:=		http://bogofilter.sourceforge.net/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=bogofilter/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,BOGOFILTER,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE:=	autotool gnu
CONFIGURE_ENV+=		LIBS="-liconv"
CONFIGURE_ARGS+=	--without-libsqlite3-prefix \
			--without-libqdbm-prefix \
			--with-included-gsl \
			--with-libdb-prefix=${STAGING_DIR}/usr \
			--disable-transactions
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_BOGOFILTER}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/${PKG_NAME} ${IDIR_BOGOFILTER}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
