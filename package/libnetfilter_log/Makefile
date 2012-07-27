# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libnetfilter_log
PKG_VERSION:=		1.0.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		2a4bb0654ae675a52d2e8d1c06090b94
PKG_DESCR:=		API to packets that have been logged
PKG_SECTION:=		libs
PKG_DEPENDS:=		libnfnetlink
PKG_BUILDDEP:=		libnfnetlink
PKG_URL:=		http://www.netfilter.org/projects/libnetfilter_log/
PKG_SITES:=		http://www.netfilter.org/projects/libnetfilter_log/files/

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

PKG_SUBPKGS:=		LIBNETFILTER_LOG LIBNETFILTER_LOG_DEV
PKGSC_LIBNETFILTER_LOG_DEV:=	devel
PKGSD_LIBNETFILTER_LOG_DEV:=	libnetfilter-log headers

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBNETFILTER_LOG,libnetfilter-log,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBNETFILTER_LOG_DEV,libnetfilter-log-dev,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBNETFILTER_LOG_DEV},${PKGSC_LIBNETFILTER_LOG_DEV}))

libnetfilter-log-install:
	$(INSTALL_DIR) $(IDIR_LIBNETFILTER_LOG)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libnetfilter_log*so* \
		$(IDIR_LIBNETFILTER_LOG)/usr/lib

libnetfilter-log-dev-install:
	$(INSTALL_DIR) $(IDIR_LIBNETFILTER_LOG_DEV)/usr/include
	$(CP) $(WRKINST)/usr/include/* \
		$(IDIR_LIBNETFILTER_LOG_DEV)/usr/include
	$(INSTALL_DIR) $(IDIR_LIBNETFILTER_LOG_DEV)/usr/lib/pkgconfig
	$(CP) $(WRKINST)/usr/lib/pkgconfig/*.pc \
		$(IDIR_LIBNETFILTER_LOG_DEV)/usr/lib/pkgconfig

include ${TOPDIR}/mk/pkg-bottom.mk
