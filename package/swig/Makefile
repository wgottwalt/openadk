# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		swig
PKG_VERSION:=		3.0.7
PKG_RELEASE:=		1
PKG_HASH:=		06dc8816a225667ce1eee545af3caf87e1bbaa379c32838d4cea53152514348d
PKG_DESCR:=		swig utility
PKG_SECTION:=		dev/tools
PKG_URL:=		http://www.swig.org/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=swig/}

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_CFLINE_SWIG:=	depends on ADK_HOST_ONLY

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,SWIG,swig,$(PKG_VERSION)-${PKG_RELEASE}))

HOST_ALL_TARGET:=	swig
HOST_CONFIGURE_ARGS+=	--without-pcre

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
