# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libfontenc
PKG_VERSION:=		1.1.3
PKG_RELEASE:=		1
PKG_HASH:=		6fba26760ca8d5045f2b52ddf641c12cedc19ee30939c6478162b7db8b6220fb
PKG_DESCR:=		helps to deal with different encodings of fonts
PKG_SECTION:=		x11/libs
PKG_DEPENDS:=		zlib
PKG_BUILDDEP:=		xproto zlib
PKG_SITES:=		http://www.x.org/releases/individual/lib/
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBFONTENC,libfontenc,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

libfontenc-install:
	${INSTALL_DIR} ${IDIR_LIBFONTENC}/usr/lib
	${CP} ${WRKINST}/usr/lib/libfontenc.so* ${IDIR_LIBFONTENC}/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
