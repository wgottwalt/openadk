# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		kbproto
PKG_VERSION:=		1.0.6
PKG_RELEASE:=		1
PKG_DESCR:=		X11 keyboard protocol headers
PKG_SECTION:=		devel
PKG_BUILDDEP:=		kbproto-host
PKG_MD5SUM:=		9c650b7947fe59b3f144518400e8d029
PKG_SITES:=		${MASTER_SITE_XORG}
PKG_OPTS:=		dev devonly

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(TOPDIR)/mk/host.mk
include $(TOPDIR)/mk/package.mk

$(eval $(call HOST_template,KBPROTO,kbproto,$(PKG_VERSION)-${PKG_RELEASE}))
$(eval $(call PKG_template,KBPROTO,kbproto,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

HOST_STYLE:=		auto

include ${TOPDIR}/mk/host-bottom.mk
include ${TOPDIR}/mk/pkg-bottom.mk
