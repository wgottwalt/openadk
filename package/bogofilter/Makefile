# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		bogofilter
PKG_VERSION:=		1.2.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		a12a16d88d6d565dacf2a5e6259a3337
PKG_DESCR:=		mail filter
PKG_SECTION:=		mail
PKG_DEPENDS:=		libiconv libdb
PKG_BUILDDEP:=		libiconv libdb
PKG_URL:=		http://bogofilter.sourceforge.net/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=bogofilter/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,BOGOFILTER,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ENV+=		LIBS="-liconv" \
			ac_cv_func_memcmp_working=yes
CONFIGURE_ARGS+=	--without-libsqlite3-prefix \
			--without-libqdbm-prefix \
			--with-included-gsl \
			--with-libdb-prefix=${STAGING_DIR}/usr \
			--disable-transactions

post-install:
	${INSTALL_DIR} ${IDIR_BOGOFILTER}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/bogofilter \
		 ${IDIR_BOGOFILTER}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
