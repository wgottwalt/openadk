# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		intltool
PKG_VERSION:=		0.50.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		23fbd879118253cb99aeac067da5f591
PKG_DESCR:=		internationalization utility to create po files
PKG_SECTION:=		dev/tools
PKG_URL:=		http://freedesktop.org/wiki/Software/intltool/
PKG_SITES:=		https://launchpad.net/intltool/trunk/0.50.2/+download/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_CFLINE_INTLTOOL:=	depends on ADK_HOST_ONLY

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,INTLTOOL,intltool,$(PKG_VERSION)-${PKG_RELEASE}))

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
