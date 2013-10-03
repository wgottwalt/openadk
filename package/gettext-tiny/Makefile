# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		gettext-tiny
PKG_VERSION:=		0.1
PKG_RELEASE:=		1
PKG_DESCR:=		Gettext stub and replacement
PKG_SECTION:=		libs
PKG_URL:=		https://github.com/rofl0r/gettext-tiny

WRKDIST=		${WRKDIR}/${PKG_NAME}-${PKG_VERSION}
NO_DISTFILES:=		1

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,GETTEXT_TINY,gettext-tiny,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual

include ${TOPDIR}/mk/pkg-bottom.mk
