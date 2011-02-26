# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libnfnetlink
PKG_VERSION:=		1.0.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		016fdec8389242615024c529acc1adb8
PKG_DESCR:=		low-level library for netfilter related kernel/userspace communication
PKG_SECTION:=		libs
PKG_URL:=		http://www.netfilter.org/projects/libnfnetlink/
PKG_SITES:=		http://www.netfilter.org/projects/libnfnetlink/files/

PKG_SUBPKGS:=		LIBNFNETLINK LIBNFNETLINK_DEV

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBNFNETLINK,libnfnetlink,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBNFNETLINK_DEV,libnfnetlink-dev,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

libnfnetlink-install:
	$(INSTALL_DIR) $(IDIR_LIBNFNETLINK)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libnfnetlink.so* $(IDIR_LIBNFNETLINK)/usr/lib

libnfnetlink-dev-install:
	$(INSTALL_DIR) $(IDIR_LIBNFNETLINK_DEV)/usr/include
	$(CP) $(WRKINST)/usr/include/* $(IDIR_LIBNFNETLINK_DEV)/usr/include
	$(INSTALL_DIR) $(IDIR_LIBNFNETLINK_DEV)/usr/lib/pkgconfig
	${CP} ${WRKINST}/usr/lib/pkgconfig/*.pc \
		$(IDIR_LIBNFNETLINK_DEV)/usr/lib/pkgconfig

include ${TOPDIR}/mk/pkg-bottom.mk
