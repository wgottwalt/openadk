# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		subversion
PKG_VERSION:=		1.6.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		93f128306b11e1a1c64ff51338777952
PKG_DESCR:=		revision control program
PKG_SECTION:=		net
PKG_DEPENDS:=		zlib apr apr-util libiconv libexpat
PKG_SITES:=		http://subversion.tigris.org/downloads/

include ${TOPDIR}/mk/package.mk

ifeq ($(ADK_PACKAGE_SUBVERSION_NEON),y)
PKG_DEPENDS+=		neon
endif

$(eval $(call PKG_template,SUBVERSION,$(PKG_NAME),${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE:=	gnu
CONFIGURE_ARGS+=	--with-apr=${STAGING_DIR}/usr/bin/apr-config
CONFIGURE_ARGS+=	--with-apr-util=${STAGING_DIR}/usr/bin/apr-config
CONFIGURE_ARGS+=	--disable-mod-activation
CONFIGURE_ARGS+=	--disable-keychain
CONFIGURE_ARGS+=	--without-apxs
CONFIGURE_ARGS+=	--without-swig
CONFIGURE_ARGS+=	--disable-experimental-libtool
CONFIGURE_ARGS+=	--without-jikes
CONFIGURE_ARGS+=	--without-jdk
CONFIGURE_ARGS+=	--disable-javahl
CONFIGURE_ARGS+=	--without-berkeley-db

LIBS= 			-laprutil-0 -lapr-0 -lexpat -liconv

ifeq ($(ADK_PACKAGE_SUBVERSION_NEON),y)
CONFIGURE_ARGS+=	-disable-neon-version-check
LIBS+=			-lneon
else
CONFIGURE_ARGS+=	--without-neon
endif

ifeq ($(ADK_PACKAGE_APR_THREADING),y)
LIBS+=			-pthread
endif

CONFIGURE_ENV+=		LIBS='${LIBS}'

BUILD_STYLE:=           auto
INSTALL_STYLE:=		auto
INSTALL_TARGET:=	external-install local-install

post-install:
	${INSTALL_DIR} ${IDIR_SUBVERSION}/usr/{bin,lib}
	${CP} ${WRKINST}/usr/bin/* ${IDIR_SUBVERSION}/usr/bin
	${CP} ${WRKINST}/usr/lib/*.so* ${IDIR_SUBVERSION}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
