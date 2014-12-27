# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		presentproto
PKG_VERSION:=		1.0
PKG_RELEASE:=		1
PKG_HASH:=		02f8042cb351dd5c3699a0dbdb2ab25f86532efe3e1e3e97897e7f44b5c67040
PKG_DESCR:=		present protocol headers
PKG_SECTION:=		dev/header
PKG_SITES:=		${MASTER_SITE_XORG}
PKG_OPTS:=              dev devonly

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,PRESENTPROTO,presentproto,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
