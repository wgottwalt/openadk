# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libnetfilter_log
PKG_VERSION:=		1.0.1
PKG_RELEASE:=		2
PKG_MD5SUM:=		2a4bb0654ae675a52d2e8d1c06090b94
PKG_DESCR:=		api to packets that have been logged
PKG_SECTION:=		libs/net
PKG_DEPENDS:=		libnfnetlink
PKG_BUILDDEP:=		libnfnetlink
PKG_URL:=		http://www.netfilter.org/projects/libnetfilter_log/
PKG_SITES:=		http://www.netfilter.org/projects/libnetfilter_log/files/
PKG_OPTS:=		dev

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBNETFILTER_LOG,libnetfilter-log,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

libnetfilter-log-install:
	$(INSTALL_DIR) $(IDIR_LIBNETFILTER_LOG)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libnetfilter_log*so* \
		$(IDIR_LIBNETFILTER_LOG)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
