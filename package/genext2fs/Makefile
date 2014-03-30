# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		genext2fs
PKG_VERSION:=		1.4.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		b7b6361bcce2cedff1ae437fadafe53b
PKG_DESCR:=		genext2fs utility
PKG_SECTION:=		fs
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=genext2fs/}

PKG_CFLINE_GENEXT2FS:=	depends on ADK_HOST_ONLY

include $(TOPDIR)/mk/host.mk
include $(TOPDIR)/mk/package.mk

$(eval $(call HOST_template,GENEXT2FS,genext2fs,$(PKG_VERSION)-${PKG_RELEASE}))

HOST_STYLE:=		auto

include ${TOPDIR}/mk/host-bottom.mk
include ${TOPDIR}/mk/pkg-bottom.mk
