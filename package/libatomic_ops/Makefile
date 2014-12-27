# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libatomic_ops
PKG_VERSION:=		7.4.0
PKG_RELEASE:=		1
PKG_HASH:=		2875ccc29254d3375dab9c5930c42df342f148f8cd7c646621dbf03f8c1d5b5a
PKG_DESCR:=		atomic operations library
PKG_SECTION:=		libs/misc
PKG_URL:=		http://www.hboehm.info/gc/
PKG_SITES:=		http://www.hboehm.info/gc/gc_source/
PKG_LIBNAME:=		libatomic-ops
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,LIBATOMIC_OPS,libatomic-ops,$(PKG_VERSION)-${PKG_RELEASE}))
$(eval $(call PKG_template,LIBATOMIC_OPS,libatomic-ops,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

libatomic-ops-install:
	$(INSTALL_DIR) $(IDIR_LIBATOMIC_OPS)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libatomic_ops*.so* \
		$(IDIR_LIBATOMIC_OPS)/usr/lib

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
