# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libgc
PKG_VERSION:=		7.4.0
PKG_RELEASE:=		2
PKG_MD5SUM:=		f40d9a47c90d60791eeecb484f8df5ee
PKG_DESCR:=		garbage collector library
PKG_SECTION:=		libs/misc
PKG_BUILDDEP:=		libatomic_ops
HOST_BUILDDEP:=		libatomic_ops-host
PKG_URL:=		http://www.hboehm.info/gc/
PKG_SITES:=		http://www.hboehm.info/gc/gc_source/
PKG_OPTS:=		dev

DISTFILES=		gc-${PKG_VERSION}.tar.gz
WRKDIST=		${WRKDIR}/gc-${PKG_VERSION}

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,LIBGC,libgc,$(PKG_VERSION)-${PKG_RELEASE}))
$(eval $(call PKG_template,LIBGC,libgc,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

libgc-install:
	$(INSTALL_DIR) $(IDIR_LIBGC)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libgc*.so* \
		$(IDIR_LIBGC)/usr/lib

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
