# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		check
PKG_VERSION:=		0.9.12
PKG_RELEASE:=		1
PKG_MD5SUM:=		46fe540d1a03714c7a1967dbc6d484e7
PKG_DESCR:=		unit testing framework for C
PKG_SECTION:=		libs
PKG_URL:=		http://check.sourceforge.net/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=check/}
PKG_LIBNAME:=		libcheck
PKG_OPTS:=		dev

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBCHECK,libcheck,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

libcheck-install:
	$(INSTALL_DIR) $(IDIR_CHECK)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libcheck*.so* \
		$(IDIR_CHECK)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
