# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		xkbcomp
PKG_VERSION:=		1.0.5
PKG_RELEASE:=		2
PKG_MD5SUM:=		10e6661a35aa994a9aa73ded0cf70259
PKG_DESCR:=		x11 keyboard compiler
PKG_SECTION:=		x11/misc
PKG_BUILDDEP:=		libxkbfile libX11
PKG_DEPENDS:=		libxkbfile libx11
PKG_SITES:=		http://xorg.freedesktop.org/releases/X11R7.4/src/everything/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XKBCOMP,xkbcomp,$(PKG_VERSION)-$(PKG_RELEASE),${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

xkbcomp-install:
	${INSTALL_DIR} ${IDIR_XKBCOMP}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/xkbcomp ${IDIR_XKBCOMP}/usr/bin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
