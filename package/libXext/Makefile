# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libXext
PKG_VERSION:=		1.3.1
PKG_RELEASE:=		2
PKG_MD5SUM:=		249478eae5c4fab7722894cb99565405
PKG_DESCR:=		client interface to extensions of the x protocol
PKG_SECTION:=		x11/libs
PKG_BUILDDEP:=		libX11 xextproto libXext-host
PKG_SITES:=		${MASTER_SITE_XORG}
PKG_LIBNAME:=		libxext
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(TOPDIR)/mk/host.mk
include $(TOPDIR)/mk/package.mk

$(eval $(call HOST_template,LIBXEXT,libxext,$(PKG_VERSION)-${PKG_RELEASE}))
$(eval $(call PKG_template,LIBXEXT,libxext,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

HOST_STYLE:=		auto
CONFIGURE_ARGS+=	--disable-malloc0returnsnull

libxext-install:
	${INSTALL_DIR} ${IDIR_LIBXEXT}/usr/lib
	${CP} ${WRKINST}/usr/lib/libXext.so* ${IDIR_LIBXEXT}/usr/lib/

include ${TOPDIR}/mk/host-bottom.mk
include ${TOPDIR}/mk/pkg-bottom.mk
