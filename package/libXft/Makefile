# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libXft
PKG_VERSION:=		2.3.1
PKG_RELEASE:=		2
PKG_HASH:=		df3765d1454bb148fc0886f0723dc9f40430243a06e94414475c6af2a72e8915
PKG_DESCR:=		freetype library
PKG_SECTION:=		x11/libs
PKG_BUILDDEP:=		libXrender fontconfig
PKG_SITES:=		${MASTER_SITE_XORG}
PKG_LIBNAME:=		libxft
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBXFT,libxft,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

libxft-install:
	${INSTALL_DIR} ${IDIR_LIBXFT}/usr/lib
	${CP} ${WRKINST}/usr/lib/libXft.so* ${IDIR_LIBXFT}/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
