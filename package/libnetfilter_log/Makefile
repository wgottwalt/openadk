# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libnetfilter_log
PKG_VERSION:=		0.0.16
PKG_RELEASE:=		1
PKG_MD5SUM:=		4ffcf46dad9d0c81f6611dd185639694
PKG_DESCR:=		API to packets that have been logged
PKG_SECTION:=		libs
PKG_DEPENDS:=		libnfnetlink
PKG_BUILDDEP+=		libnfnetlink
PKG_URL:=		http://www.netfilter.org/projects/libnetfilter_log/
PKG_SITES:=		http://www.netfilter.org/projects/libnetfilter_log/files/

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBNETFILTER_LOG,libnetfilter-log,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

post-install:
	$(INSTALL_DIR) $(IDIR_LIBNETFILTER_LOG)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libnetfilter_log*so* \
		$(IDIR_LIBNETFILTER_LOG)/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
