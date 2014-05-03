# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		swig
PKG_VERSION:=		2.0.11
PKG_RELEASE:=		1
PKG_MD5SUM:=		291ba57c0acd218da0b0916c280dcbae
PKG_DESCR:=		swig utility
PKG_SECTION:=		lang
PKG_URL:=		http://www.swig.org/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=swig/}

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_ARCH_DEPENDS:=	native

include $(TOPDIR)/mk/host.mk
include $(TOPDIR)/mk/package.mk

$(eval $(call HOST_template,SWIG,swig,$(PKG_VERSION)-${PKG_RELEASE}))

HOST_STYLE:=		auto
HOST_ALL_TARGET:=	swig

include ${TOPDIR}/mk/host-bottom.mk
include ${TOPDIR}/mk/pkg-bottom.mk
