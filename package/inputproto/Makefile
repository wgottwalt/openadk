# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		inputproto
PKG_VERSION:=		2.3
PKG_RELEASE:=		1
PKG_DESCR:=		X Input Extension headers
PKG_SECTION:=		devel
PKG_BUILDDEP:=		inputproto-host
PKG_MD5SUM:=		5ea366d32a9a78d6204a47ea35d9dc5c
PKG_SITES:=		${MASTER_SITE_XORG}
PKG_OPTS:=		dev devonly

include $(TOPDIR)/mk/host.mk
include $(TOPDIR)/mk/package.mk

$(eval $(call HOST_template,INPUTPROTO,inputproto,$(PKG_VERSION)-${PKG_RELEASE}))
$(eval $(call PKG_template,INPUTPROTO,inputproto,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

HOST_STYLE:=		auto

include ${TOPDIR}/mk/host-bottom.mk
include ${TOPDIR}/mk/pkg-bottom.mk
