# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		bogofilter
PKG_VERSION:=		1.2.2
PKG_RELEASE:=		2
PKG_MD5SUM:=		39d27c13eae8a5064d68e20d585e60de
PKG_DESCR:=		mail filter
PKG_SECTION:=		mail
PKG_BUILDDEP:=		libiconv-tiny db
PKG_DEPENDS:=		libdb
PKG_URL:=		http://bogofilter.sourceforge.net/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=bogofilter/}
PKG_NEED_CXX:=		1

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,BOGOFILTER,bogofilter,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ENV+=		LIBS="-liconv" \
			ac_cv_func_memcmp_working=yes
CONFIGURE_ARGS+=	--without-libsqlite3-prefix \
			--without-libqdbm-prefix \
			--with-included-gsl \
			--disable-static \
			--with-libdb-prefix=${STAGING_TARGET_DIR}/usr \
			--disable-transactions

pre-build:
	touch $(WRKBUILD)/src/lexer_v3.l $(WRKBUILD)/src/Makefile.in $(WRKBUILD)/src/lexer_v3.c

post-install:
	${INSTALL_DIR} ${IDIR_BOGOFILTER}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/bogofilter \
		 ${IDIR_BOGOFILTER}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
