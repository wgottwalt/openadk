# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libnetfilter_queue
PKG_VERSION:=		1.0.2
PKG_RELEASE:=		3
PKG_MD5SUM:=		df09befac35cb215865b39a36c96a3fa
PKG_DESCR:=		api to packets that have been queued by the kernel packet filter
PKG_SECTION:=		libs/net
PKG_DEPENDS:=		libnfnetlink libmnl
PKG_BUILDDEP:=		libnfnetlink libmnl
PKG_URL:=		http://www.netfilter.org/projects/libnetfilter_queue/
PKG_SITES:=		http://www.netfilter.org/projects/libnetfilter_queue/files/
PKG_OPTS:=		dev

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBNETFILTER_QUEUE,libnetfilter-queue,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

TARGET_CPPFLAGS+=	-D_GNU_SOURCE

libnetfilter-queue-install:
	$(INSTALL_DIR) $(IDIR_LIBNETFILTER_QUEUE)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libnetfilter_queue*so* \
		$(IDIR_LIBNETFILTER_QUEUE)/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
