# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libnetfilter_queue
PKG_VERSION:=		0.0.17
PKG_RELEASE:=		1
PKG_BUILDDEP+=		libnfnetlink
PKG_MD5SUM:=		2cde35e678ead3a8f9eb896bf807a159
PKG_DESCR:=		API to packets that have been queued by the kernel packet filter
PKG_SECTION:=		libs
PKG_DEPENDS:=		libnfnetlink
PKG_URL:=		http://www.netfilter.org/projects/libnetfilter_queue/
PKG_SITES:=		http://www.netfilter.org/projects/libnetfilter_queue/files/

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBNETFILTER_QUEUE,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE:=	gnu
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	$(INSTALL_DIR) $(IDIR_LIBNETFILTER_QUEUE)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libnetfilter_queue*so* \
		$(IDIR_LIBNETFILTER_QUEUE)/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
