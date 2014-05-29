# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		ccache
PKG_VERSION:=		3.1.9
PKG_RELEASE:=		1
PKG_MD5SUM:=		367916e4ecba4968f77f59a378e61458
PKG_DESCR:=		compiler cache utility
PKG_SECTION:=		dev/tools
PKG_SITES:=		http://samba.org/ftp/ccache/

PKG_CFLINE_CCACHE:=	depends on ADK_HOST_ONLY

include $(TOPDIR)/mk/host.mk
include $(TOPDIR)/mk/package.mk

$(eval $(call HOST_template,CCACHE,ccache,$(PKG_VERSION)-${PKG_RELEASE}))

HOST_STYLE:=		auto

include ${TOPDIR}/mk/host-bottom.mk
include ${TOPDIR}/mk/pkg-bottom.mk
