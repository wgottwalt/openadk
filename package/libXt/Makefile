# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libXt
PKG_VERSION:=		1.1.3
PKG_RELEASE:=		3
PKG_MD5SUM:=		7a80ed7aba06668b12ebd0910318a1f1
PKG_DESCR:=		x toolkit intrinsics libraries
PKG_SECTION:=		x11/libs
PKG_DEPENDS:=		libsm libice libuuid libx11 libxau libxdmcp libxcb
PKG_BUILDDEP:=		autotool
PKG_BUILDDEP+=		libSM libX11 kbproto util-macros
HOST_BUILDDEP:=		util-macros-host libICE-host libSM-host
PKG_SITES:=		${MASTER_SITE_XORG}
PKG_LIBNAME:=		libxt
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(TOPDIR)/mk/host.mk
include $(TOPDIR)/mk/package.mk

$(eval $(call HOST_template,LIBXT,libxt,$(PKG_VERSION)-${PKG_RELEASE}))
$(eval $(call PKG_template,LIBXT,libxt,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

HOST_STYLE:=		auto
AUTOTOOL_STYLE:=	autoreconf
CONFIGURE_ENV+=		CFLAGS_FOR_BUILD="$(CPPFLAGS_FOR_BUILD) $(CFLAGS_FOR_BUILD)"
CONFIGURE_ARGS+=	--disable-malloc0returnsnull

libxt-install:
	${INSTALL_DIR} ${IDIR_LIBXT}/usr/lib
	${CP} ${WRKINST}/usr/lib/libXt.so* ${IDIR_LIBXT}/usr/lib

include ${TOPDIR}/mk/host-bottom.mk
include ${TOPDIR}/mk/pkg-bottom.mk
