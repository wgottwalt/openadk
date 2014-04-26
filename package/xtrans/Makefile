# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		xtrans
PKG_VERSION:=		1.3.3
PKG_RELEASE:=		1
PKG_DESCR:=		X11 network protocol transport library
PKG_SECTION:=		devel
PKG_BUILDDEP:=		xtrans-host
PKG_MD5SUM:=		c83d04cd878f1e51a44d132aa1d5b932
PKG_SITES:=		${MASTER_SITE_XORG}
PKG_OPTS:=		dev devonly

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(TOPDIR)/mk/host.mk
include $(TOPDIR)/mk/package.mk

$(eval $(call HOST_template,XTRANS,xtrans,$(PKG_VERSION)-${PKG_RELEASE}))
$(eval $(call PKG_template,XTRANS,xtrans,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

HOST_STYLE:=		auto
HOST_CONFIGURE_ARGS+=	--datadir=$(STAGING_HOST_DIR)/usr/lib
CONFIGURE_ARGS+=	--datadir=/usr/lib

include ${TOPDIR}/mk/host-bottom.mk
include ${TOPDIR}/mk/pkg-bottom.mk
