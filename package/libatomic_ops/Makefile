# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libatomic_ops
PKG_VERSION:=		7.4.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		59f9a7cc845dcc775e7b7901eb582766
PKG_DESCR:=		atomic operations library
PKG_SECTION:=		libs
PKG_URL:=		http://www.hboehm.info/gc/
PKG_SITES:=		http://www.hboehm.info/gc/gc_source/
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(TOPDIR)/mk/host.mk
include $(TOPDIR)/mk/package.mk

$(eval $(call HOST_template,LIBATOMIC_OPS,libatomic_ops,$(PKG_VERSION)-${PKG_RELEASE}))
$(eval $(call PKG_template,LIBATOMIC_OPS,libatomic_ops,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

HOST_STYLE:=		auto

libatomic_ops-install:
	$(INSTALL_DIR) $(IDIR_LIBATOMIC_OPS)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libatomic_ops*.so* \
		$(IDIR_LIBATOMIC_OPS)/usr/lib

include ${TOPDIR}/mk/host-bottom.mk
include ${TOPDIR}/mk/pkg-bottom.mk
