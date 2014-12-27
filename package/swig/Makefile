# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		swig
PKG_VERSION:=		2.0.11
PKG_RELEASE:=		2
PKG_HASH:=		63780bf29f53937ad399a1f68bccb3730c90f65746868c4cdfc25cafcd0a424e
PKG_DESCR:=		swig utility
PKG_SECTION:=		dev/tools
PKG_URL:=		http://www.swig.org/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=swig/}

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_ARCH_DEPENDS:=	native

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,SWIG,swig,$(PKG_VERSION)-${PKG_RELEASE}))

HOST_ALL_TARGET:=	swig
HOST_CONFIGURE_ARGS+=	--without-pcre

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
