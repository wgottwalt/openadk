# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libXcomposite
PKG_VERSION:=		0.4.4
PKG_RELEASE:=		1
PKG_HASH:=		83c04649819c6f52cda1b0ce8bcdcc48ad8618428ad803fb07f20b802f1bdad1
PKG_DESCR:=		composite library
PKG_SECTION:=		x11/libs
PKG_BUILDDEP:=		libX11 compositeproto libXfixes
HOST_BUILDDEP:=		libX11-host compositeproto-host libXfixes-host
PKG_SITES:=		http://www.x.org/releases/individual/lib/
PKG_LIBNAME:=		libxcomposite
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,LIBXCOMPOSITE,libxcomposite,$(PKG_VERSION)-${PKG_RELEASE}))
$(eval $(call PKG_template,LIBXCOMPOSITE,libxcomposite,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

HOST_STYLE:=		auto

libxcomposite-install:
	${INSTALL_DIR} ${IDIR_LIBXCOMPOSITE}/usr/lib
	${CP} ${WRKINST}/usr/lib/libXcomposite.so* ${IDIR_LIBXCOMPOSITE}/usr/lib/

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
