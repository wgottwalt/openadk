# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		util-macros
PKG_VERSION:=		1.18.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		fd0ba21b3179703c071bbb4c3e5fb0f4
PKG_DESCR:=		xorg macros
PKG_SECTION:=		x11/misc
PKG_BUILDDEP:=		autotool util-macros-host
PKG_URL:=		http://cgit.freedesktop.org/xorg/util/macros
PKG_SITES:=		http://xorg.freedesktop.org/archive/individual/util/
PKG_OPTS:=		dev devonly

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(TOPDIR)/mk/host.mk
include $(TOPDIR)/mk/package.mk

$(eval $(call HOST_template,UTIL_MACROS,util-macros,$(PKG_VERSION)-${PKG_RELEASE}))
$(eval $(call PKG_template,UTIL_MACROS,util-macros,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

HOST_STYLE:=		auto
AUTOTOOL_STYLE:=	autoreconf

include ${TOPDIR}/mk/host-bottom.mk
include ${TOPDIR}/mk/pkg-bottom.mk
