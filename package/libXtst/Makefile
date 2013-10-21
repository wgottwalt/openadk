# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libXtst
PKG_VERSION:=		1.2.1
PKG_RELEASE:=		2
PKG_MD5SUM:=		8918809e47c29b44d25eb16b1586a15b
PKG_DESCR:=		Xtst library
PKG_SECTION:=		x11/libs
PKG_BUILDDEP:=		recordproto libXi
PKG_SITES:=		${MASTER_SITE_XORG}
PKG_OPTS:=		dev

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBXTST,libxtst,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_ARGS+= 	--disable-malloc0returnsnull

libxtst-install:
	${INSTALL_DIR} ${IDIR_LIBXTST}/usr/lib
	${CP} ${WRKINST}/usr/lib/libXtst.so* ${IDIR_LIBXTST}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
