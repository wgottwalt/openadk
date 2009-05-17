# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libnfsidmap
PKG_VERSION:=		0.21b1
PKG_RELEASE:=		1
PKG_MD5SUM:=		a8a44bd4aa22441fb54735dd65496b72
MASTER_SITES:=		http://www.citi.umich.edu/projects/nfsv4/linux/libnfsidmap/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBNFSIDMAP,libnfsidmap,$(PKG_VERSION)-$(PKG_RELEASE),$(ARCH)))

CONFIGURE_STYLE=	gnu
BUILD_STYLE=		auto
INSTALL_STYLE=		auto

post-install:
	$(INSTALL_DIR) $(IDIR_LIBNFSIDMAP)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libnfsidmap.so* \
		$(IDIR_LIBNFSIDMAP)/usr/lib/
	$(CP) $(WRKINST)/usr/lib/libnfsidmap_static.so* \
		$(IDIR_LIBNFSIDMAP)/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
