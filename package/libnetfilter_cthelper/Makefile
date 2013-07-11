# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libnetfilter_cthelper
PKG_VERSION:=		1.0.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		b2efab1a3a198a5add448960ba011acd
PKG_DESCR:=		userspace library that provides the API to the user-space helper infrastructure
PKG_SECTION:=		libs
PKG_DEPENDS:=		libnfnetlink libmnl
PKG_BUILDDEP:=		libnfnetlink libmnl
PKG_URL:=		http://www.netfilter.org/projects/libnetfilter_cthelper/
PKG_SITES:=		http://www.netfilter.org/projects/libnetfilter_cthelper/files/

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBNETFILTER_CTHELPER,libnetfilter-cthelper,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

post-install:
	$(INSTALL_DIR) $(IDIR_LIBNETFILTER_CTHELPER)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libnetfilter_cthelper*so* \
		$(IDIR_LIBNETFILTER_CTHELPER)/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
