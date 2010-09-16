# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		subversion
PKG_VERSION:=		1.6.12
PKG_RELEASE:=		1
PKG_MD5SUM:=		ae008ac355581c90494fba86cbfc3413
PKG_DESCR:=		revision control program
PKG_SECTION:=		scm
PKG_DEPENDS:=		zlib apr apr-util libiconv libexpat libsqlite neon
PKG_BUILDDEP:=		apr-util expat apr zlib libiconv sqlite neon
PKG_SITES:=		http://subversion.tigris.org/downloads/
PKG_URL:=		http://subversion.apache.org/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,SUBVERSION,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--with-apr=${STAGING_DIR}/usr/bin/apr-1-config
CONFIGURE_ARGS+=	--with-apr-util=${STAGING_DIR}/usr/bin/apr-1-config
CONFIGURE_ARGS+=	--disable-mod-activation
CONFIGURE_ARGS+=	--disable-keychain
CONFIGURE_ARGS+=	--without-apxs
CONFIGURE_ARGS+=	--without-swig
CONFIGURE_ARGS+=	--disable-experimental-libtool
CONFIGURE_ARGS+=	--without-jikes
CONFIGURE_ARGS+=	--without-jdk
CONFIGURE_ARGS+=	--disable-javahl
CONFIGURE_ARGS+=	--without-berkeley-db
CONFIGURE_ENV+=		LIBS='-lsqlite3 -laprutil-1 -lapr-1 -lexpat -liconv'
INSTALL_TARGET:=	external-install local-install

post-install:
	${INSTALL_DIR} ${IDIR_SUBVERSION}/usr/{bin,lib}
	${INSTALL_BIN} ${WRKINST}/usr/bin/svn ${IDIR_SUBVERSION}/usr/bin
	${CP} ${WRKINST}/usr/lib/libsvn*.so* ${IDIR_SUBVERSION}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
