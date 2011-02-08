# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libnfsidmap
PKG_VERSION:=		0.21b1
PKG_RELEASE:=		1
PKG_MD5SUM:=		a8a44bd4aa22441fb54735dd65496b72
PKG_DESCR:=		idmap library for NFSv4
PKG_SECTION:=		libs
PKG_URL:=		http://www.citi.umich.edu/projects/nfsv4/linux/
PKG_SITES:=		http://www.citi.umich.edu/projects/nfsv4/linux/libnfsidmap/

PKG_SUBPKGS:=		LIBNFSIDMAP LIBNFSIDMAP_DEV
PKGSC_LIBNFSIDMAP_DEV:=	devel
PKGSD_LIBNFSIDMAP_DEV:=	headers for NFSv4 idmap library

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBNFSIDMAP,${PKG_NAME},$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBNFSIDMAP_DEV,libnfsidmap-dev,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBNFSIDMAP_DEV},${PKGSC_LIBNFSIDMAP_DEV}))

libnfsidmap-install:
	$(INSTALL_DIR) $(IDIR_LIBNFSIDMAP)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libnfsidmap.so* \
		$(IDIR_LIBNFSIDMAP)/usr/lib/
	$(CP) $(WRKINST)/usr/lib/libnfsidmap_static.so* \
		$(IDIR_LIBNFSIDMAP)/usr/lib/

libnfsidmap-dev-install:
	$(INSTALL_DIR) $(IDIR_LIBNFSIDMAP_DEV)/usr/include
	$(INSTALL_DATA) ${WRKINST}/usr/include/nfsidmap.h \
		$(IDIR_LIBNFSIDMAP_DEV)/usr/include

include ${TOPDIR}/mk/pkg-bottom.mk
