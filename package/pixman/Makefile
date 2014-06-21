# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		pixman
PKG_VERSION:=		0.32.4
PKG_RELEASE:=		1
PKG_MD5SUM:=		eba449138b972fbf4547a8c152fea162
PKG_DESCR:=		pixel manipulation library
PKG_SECTION:=		x11/libs
PKG_BUILDDEP:=		libpng
HOST_BUILDDEP:=		libpng-host
PKG_SITES:=		http://www.cairographics.org/releases/
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,PIXMAN,pixman,$(PKG_VERSION)-${PKG_RELEASE}))
$(eval $(call PKG_template,PIXMAN,pixman,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_ARGS+=	--disable-gtk \
			--disable-arm-iwmmxt

pixman-install:
	${INSTALL_DIR} ${IDIR_PIXMAN}/usr/lib
	${CP} ${WRKINST}/usr/lib/libpixman-1.so* ${IDIR_PIXMAN}/usr/lib

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
