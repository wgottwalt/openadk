# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libmnl
PKG_VERSION:=		1.0.3
PKG_RELEASE:=		2
PKG_HASH:=		6f14336e9acdbc62c2dc71bbb59ce162e54e9af5c80153e92476c5443fe784de
PKG_DESCR:=		minimalistic user-space library oriented to netlink developers
PKG_SECTION:=		libs/net
PKG_URL:=		http://www.netfilter.org/projects/libmnl/
PKG_SITES:=		http://www.netfilter.org/projects/libmnl/files/
PKG_OPTS:=		dev

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBMNL,libmnl,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

libmnl-install:
	$(INSTALL_DIR) $(IDIR_LIBMNL)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libmnl.so* $(IDIR_LIBMNL)/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
