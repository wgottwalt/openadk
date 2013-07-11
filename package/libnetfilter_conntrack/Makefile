# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libnetfilter_conntrack
PKG_VERSION:=		1.0.3
PKG_RELEASE:=		1
PKG_MD5SUM:=		73394a3d8d0cfecc6abb6027b4792d52
PKG_DESCR:=		API to connection tracking state table
PKG_SECTION:=		libs
PKG_DEPENDS:=		libnfnetlink
PKG_BUILDDEP:=		libnfnetlink
PKG_URL:=		http://www.netfilter.org/projects/libnetfilter_conntrack/
PKG_SITES:=		http://www.netfilter.org/projects/libnetfilter_conntrack/files/

PKG_SUBPKGS:=		LIBNETFILTER_CONNTRACK LIBNETFILTER_CONNTRACK_DEV
PKGSC_LIBNETFILTER_CONNTRACK_DEV:=	devel

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBNETFILTER_CONNTRACK,libnetfilter-conntrack,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBNETFILTER_CONNTRACK_DEV,libnetfilter-conntrack-dev,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKGSC_LIBNETFILTER_CONNTRACK_DEV}))

libnetfilter-conntrack-install:
	$(INSTALL_DIR) $(IDIR_LIBNETFILTER_CONNTRACK)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libnetfilter_conntrack*so* \
		$(IDIR_LIBNETFILTER_CONNTRACK)/usr/lib

libnetfilter-conntrack-dev-install:
	$(INSTALL_DIR) $(IDIR_LIBNETFILTER_CONNTRACK_DEV)/usr/include
	$(CP) $(WRKINST)/usr/include/* \
		$(IDIR_LIBNETFILTER_CONNTRACK_DEV)/usr/include
	$(INSTALL_DIR) $(IDIR_LIBNETFILTER_CONNTRACK_DEV)/usr/lib/pkgconfig
	${CP} ${WRKINST}/usr/lib/pkgconfig/*.pc \
		$(IDIR_LIBNETFILTER_CONNTRACK_DEV)/usr/lib/pkgconfig

include ${TOPDIR}/mk/pkg-bottom.mk
