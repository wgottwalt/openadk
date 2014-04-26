# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		xineramaproto
PKG_VERSION:=		1.2.1
PKG_RELEASE:=		1
PKG_DESCR:=		Xinerama Extension headers
PKG_SECTION:=		devel
PKG_BUILDDEP:=		xineramaproto-host
PKG_MD5SUM:=		e0e148b11739e144a546b8a051b17dde
PKG_SITES:=		${MASTER_SITE_XORG}
PKG_OPTS:=		dev devonly

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(TOPDIR)/mk/host.mk
include $(TOPDIR)/mk/package.mk

$(eval $(call HOST_template,XINERAMAPROTO,xineramaproto,$(PKG_VERSION)-${PKG_RELEASE}))
$(eval $(call PKG_template,XINERAMAPROTO,xineramaproto,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

HOST_STYLE:=		auto

include ${TOPDIR}/mk/host-bottom.mk
include ${TOPDIR}/mk/pkg-bottom.mk
