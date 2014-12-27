# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libnetfilter_queue
PKG_VERSION:=		1.0.2
PKG_RELEASE:=		3
PKG_HASH:=		838490eb5dbe358f9669823704982f5313a8d397111562373200203f93ac1a32
PKG_DESCR:=		api to packets that have been queued by the kernel packet filter
PKG_SECTION:=		libs/net
PKG_DEPENDS:=		libnfnetlink libmnl
PKG_BUILDDEP:=		libnfnetlink libmnl
PKG_URL:=		http://www.netfilter.org/projects/libnetfilter_queue/
PKG_SITES:=		http://www.netfilter.org/projects/libnetfilter_queue/files/
PKG_OPTS:=		dev

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBNETFILTER_QUEUE,libnetfilter-queue,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

TARGET_CPPFLAGS+=	-D_GNU_SOURCE

libnetfilter-queue-install:
	$(INSTALL_DIR) $(IDIR_LIBNETFILTER_QUEUE)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libnetfilter_queue*so* \
		$(IDIR_LIBNETFILTER_QUEUE)/usr/lib/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
