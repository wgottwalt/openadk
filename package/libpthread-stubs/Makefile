# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libpthread-stubs
PKG_VERSION:=		0.3
PKG_RELEASE:=		2
PKG_MD5SUM:=		a09d928c4af54fe5436002345ef71138
PKG_DESCR:=		pthread stubs
PKG_SECTION:=		dev/header
PKG_BUILDDEP:=		libpthread-stubs-host
PKG_URL:=		http://xcb.freedesktop.org/
PKG_SITES:=		${MASTER_SITE_XORG}
PKG_OPTS:=		dev devonly

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(TOPDIR)/mk/host.mk
include $(TOPDIR)/mk/package.mk

$(eval $(call HOST_template,LIBPTHREAD_STUBS,libpthread-stubs,$(PKG_VERSION)-${PKG_RELEASE}))
$(eval $(call PKG_template,LIBPTHREAD_STUBS,libpthread-stubs,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

ifeq ($(ADK_TARGET_USE_STATIC_LIBS),y)
TARGET_LDFLAGS+=	-pthread
endif

HOST_STYLE:=		auto

include ${TOPDIR}/mk/host-bottom.mk
include ${TOPDIR}/mk/pkg-bottom.mk
