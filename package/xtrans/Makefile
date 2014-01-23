# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		xtrans
PKG_VERSION:=		1.2.6
PKG_RELEASE:=		1
PKG_DESCR:=		X11 network protocol transport library
PKG_SECTION:=		devel
PKG_BUILDDEP:=		xtrans-host
PKG_MD5SUM:=		b91dd22b77a350d129a81175cd8c58cc
PKG_SITES:=		${MASTER_SITE_XORG}
PKG_OPTS:=		dev devonly

include $(TOPDIR)/mk/host.mk
include $(TOPDIR)/mk/package.mk

$(eval $(call HOST_template,XTRANS,xtrans,$(PKG_VERSION)-${PKG_RELEASE}))
$(eval $(call PKG_template,XTRANS,xtrans,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

HOST_STYLE:=		auto
HOST_CONFIGURE_ARGS+=	--datadir=$(STAGING_HOST_DIR)/usr/lib
CONFIGURE_ARGS+=	--datadir=/usr/lib

include ${TOPDIR}/mk/host-bottom.mk
include ${TOPDIR}/mk/pkg-bottom.mk
