# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		pixman
PKG_VERSION:=		0.34.0
PKG_RELEASE:=		1
PKG_HASH:=		21b6b249b51c6800dc9553b65106e1e37d0e25df942c90531d4c3997aa20a88e
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

HOST_STYLE:=		auto
CONFIGURE_ARGS+=	--disable-gtk \
			--disable-arm-iwmmxt

pixman-install:
	${INSTALL_DIR} ${IDIR_PIXMAN}/usr/lib
	${CP} ${WRKINST}/usr/lib/libpixman-1.so* ${IDIR_PIXMAN}/usr/lib

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
