# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		xextproto
PKG_VERSION:=		7.3.0
PKG_RELEASE:=		1
PKG_DESCR:=		X Protocol Extensions headers
PKG_SECTION:=		devel
PKG_BUILDDEP:=		xextproto-host
PKG_MD5SUM:=		37b700baa8c8ea7964702d948dd13821
PKG_SITES:=		${MASTER_SITE_XORG}
PKG_OPTS:=		dev devonly

include $(TOPDIR)/mk/host.mk
include $(TOPDIR)/mk/package.mk

$(eval $(call HOST_template,XEXTPROTO,xextproto,$(PKG_VERSION)-${PKG_RELEASE}))
$(eval $(call PKG_template,XEXTPROTO,xextproto,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

HOST_STYLE:=		auto

include ${TOPDIR}/mk/host-bottom.mk
include ${TOPDIR}/mk/pkg-bottom.mk
