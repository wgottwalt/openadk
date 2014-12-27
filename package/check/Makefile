# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		check
PKG_VERSION:=		0.9.12
PKG_RELEASE:=		2
PKG_HASH:=		c7d47e55e133a0ca19a52e08a99333ac55cb22618b53719b7f4117a1875b1ea3
PKG_DESCR:=		unit testing framework for c
PKG_SECTION:=		libs/misc
PKG_URL:=		http://check.sourceforge.net/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=check/}
PKG_LIBNAME:=		libcheck
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBCHECK,libcheck,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

libcheck-install:
	$(INSTALL_DIR) $(IDIR_LIBCHECK)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libcheck*.so* \
		$(IDIR_LIBCHECK)/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
