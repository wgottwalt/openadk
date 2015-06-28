# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		ccache
PKG_VERSION:=		3.2.2
PKG_RELEASE:=		1
PKG_HASH:=		4f0d99699f24d198494addca0f41a93b0150cdfd01491f15a5d7eb02c7c2a0ca
PKG_DESCR:=		compiler cache utility
PKG_SECTION:=		dev/tools
PKG_SITES:=		http://samba.org/ftp/ccache/

PKG_CFLINE_CCACHE:=	depends on ADK_HOST_ONLY

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,CCACHE,ccache,$(PKG_VERSION)-${PKG_RELEASE}))

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
