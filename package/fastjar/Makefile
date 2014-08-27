# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		fastjar
PKG_VERSION:=		0.98
PKG_RELEASE:=		1
PKG_MD5SUM:=		d2d264d343d4d0e1575832cc1023c3bf
PKG_DESCR:=		fastjar utility
PKG_SECTION:=		dev/tools
PKG_SITES:=		http://download.savannah.gnu.org/releases/fastjar/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_CFLINE_FASTJAR:=	depends on ADK_HOST_ONLY

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,FASTJAR,fastjar,$(PKG_VERSION)-${PKG_RELEASE}))

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
