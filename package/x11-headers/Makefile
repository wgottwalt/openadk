# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		x11-headers
PKG_VERSION:=		1.0
PKG_RELEASE:=		1
PKG_DESCR:=		X11 header files
PKG_BUILDDEP:=		xproto xtrans xextproto
PKG_BUILDDEP+=		xcmiscproto bigreqsproto kbproto inputproto
PKG_SECTION:=		devel

NO_DISTFILES:=		1

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,X11_HEADERS,x11-headers,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

do-install: 
	${INSTALL_DIR} ${IDIR_X11_HEADERS}/usr/include
	${CP} ${STAGING_DIR}/usr/include/X11 ${IDIR_X11_HEADERS}/usr/include

include ${TOPDIR}/mk/pkg-bottom.mk
