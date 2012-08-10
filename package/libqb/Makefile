# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libqb
PKG_VERSION:=		0.14.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		c144a5e0cd5b69c8d46a051646609f11
PKG_DESCR:=		high performance client server reusable features
PKG_SECTION:=		libs
PKG_URL:=		https://github.com/asalkeld/libqb/wiki#wiki-Releases
PKG_SITES:=		https://fedorahosted.org/releases/q/u/quarterback/


include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBQB,libqb,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

libqb-install:
	$(INSTALL_DIR) $(IDIR_LIBQB)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libqb*so* \
		$(IDIR_LIBQB)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
