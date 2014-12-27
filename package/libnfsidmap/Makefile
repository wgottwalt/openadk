# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libnfsidmap
PKG_VERSION:=		0.25
PKG_RELEASE:=		3
PKG_HASH:=		656d245d84400e1030f8f40a5a27da76370690c4a932baf249110f047fe7efcf
PKG_DESCR:=		idmap library for nfsv4
PKG_SECTION:=		libs/net
PKG_URL:=		http://www.citi.umich.edu/projects/nfsv4/linux/
PKG_SITES:=		http://www.citi.umich.edu/projects/nfsv4/linux/libnfsidmap/
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBNFSIDMAP,libnfsidmap,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

libnfsidmap-install:
	$(INSTALL_DIR) $(IDIR_LIBNFSIDMAP)/usr/lib/libnfsidmap
	$(CP) $(WRKINST)/usr/lib/libnfsidmap.so* \
		$(IDIR_LIBNFSIDMAP)/usr/lib/
	$(CP) $(WRKINST)//usr/lib/libnfsidmap/static.so \
		$(IDIR_LIBNFSIDMAP)/usr/lib/libnfsidmap

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
