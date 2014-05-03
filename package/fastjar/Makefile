# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		fastjar
PKG_VERSION:=		0.94
PKG_RELEASE:=		1
PKG_MD5SUM:=		14d4bdfac236e347d806c6743dba48c6
PKG_DESCR:=		fastjar utility
PKG_SECTION:=		lang
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=fastjar/}

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_CFLINE_FASTJAR:=	depends on ADK_HOST_ONLY

include $(TOPDIR)/mk/host.mk
include $(TOPDIR)/mk/package.mk

$(eval $(call HOST_template,FASTJAR,fastjar,$(PKG_VERSION)-${PKG_RELEASE}))

HOST_STYLE:=		auto

include ${TOPDIR}/mk/host-bottom.mk
include ${TOPDIR}/mk/pkg-bottom.mk
