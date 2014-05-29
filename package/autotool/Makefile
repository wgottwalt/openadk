# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

# meta package for host autotool infrastructure
PKG_NAME:=		autotool
PKG_VERSION:=		1.0
PKG_RELEASE:=		2
PKG_DESCR:=		autotool infrastructure for host
PKG_SECTION:=		dev/tools
PKG_BUILDDEP:=		m4-host pkgconf-host autoconf-host automake-host
PKG_BUILDDEP+=		libtool-host

NO_DISTFILES:=		1

include $(TOPDIR)/mk/package.mk

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

$(eval $(call PKG_template,AUTOTOOL,autotool,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

include ${TOPDIR}/mk/pkg-bottom.mk
