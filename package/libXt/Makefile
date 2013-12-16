# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libXt
PKG_VERSION:=		1.1.3
PKG_RELEASE:=		2
PKG_MD5SUM:=		7a80ed7aba06668b12ebd0910318a1f1
PKG_DESCR:=		X Toolkit Intrinsics libraries
PKG_SECTION:=		x11/libs
PKG_DEPENDS:=		libsm libice libuuid libx11 libxau libxdmcp libxcb
PKG_BUILDDEP:=		autotool libSM libX11 kbproto util-macros
PKG_SITES:=		${MASTER_SITE_XORG}
PKG_LIBNAME:=		libxt
PKG_OPTS:=		dev

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBXT,libxt,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

AUTOTOOL_STYLE:=	autoreconf
TARGET_CFLAGS:=         $(filter-out -flto,$(TARGET_CFLAGS))
CONFIGURE_ARGS+=	--disable-malloc0returnsnull

libxt-install:
	${INSTALL_DIR} ${IDIR_LIBXT}/usr/lib
	${CP} ${WRKINST}/usr/lib/libXt.so* ${IDIR_LIBXT}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
