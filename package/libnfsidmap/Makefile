# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libnfsidmap
PKG_VERSION:=		0.25
PKG_RELEASE:=		3
PKG_MD5SUM:=		2ac4893c92716add1a1447ae01df77ab
PKG_DESCR:=		idmap library for nfsv4
PKG_SECTION:=		libs/net
PKG_URL:=		http://www.citi.umich.edu/projects/nfsv4/linux/
PKG_SITES:=		http://www.citi.umich.edu/projects/nfsv4/linux/libnfsidmap/
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBNFSIDMAP,libnfsidmap,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

libnfsidmap-install:
	$(INSTALL_DIR) $(IDIR_LIBNFSIDMAP)/usr/lib/libnfsidmap
	$(CP) $(WRKINST)/usr/lib/libnfsidmap.so* \
		$(IDIR_LIBNFSIDMAP)/usr/lib/
	$(CP) $(WRKINST)//usr/lib/libnfsidmap/static.so \
		$(IDIR_LIBNFSIDMAP)/usr/lib/libnfsidmap

include ${TOPDIR}/mk/pkg-bottom.mk
