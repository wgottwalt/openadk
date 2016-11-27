# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libpthread-stubs
PKG_VERSION:=		0.3
PKG_RELEASE:=		2
PKG_HASH:=		3031f466cf0b06de6b3ccbf2019d15c4fcf75229b7d226a711bc1885b3a82cde
PKG_DESCR:=		pthread stubs
PKG_SECTION:=		dev/header
PKG_BUILDDEP:=		libpthread-stubs-host
PKG_URL:=		http://xcb.freedesktop.org/
PKG_SITES:=		http://xcb.freedesktop.org/dist/
PKG_OPTS:=		dev devonly

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,LIBPTHREAD_STUBS,libpthread-stubs,$(PKG_VERSION)-${PKG_RELEASE}))
$(eval $(call PKG_template,LIBPTHREAD_STUBS,libpthread-stubs,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

ifeq ($(ADK_TARGET_USE_STATIC_LIBS_ONLY),y)
TARGET_LDFLAGS+=	-pthread
endif

HOST_STYLE:=		auto

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
