# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		genext2fs
PKG_VERSION:=		1.4.1
PKG_RELEASE:=		1
PKG_HASH:=		404dbbfa7a86a6c3de8225c8da254d026b17fd288e05cec4df2cc7e1f4feecfc
PKG_DESCR:=		generate ext2 filesystem utility
PKG_SECTION:=		sys/fs
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=genext2fs/}

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_CFLINE_GENEXT2FS:=	depends on ADK_HOST_ONLY

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,GENEXT2FS,genext2fs,$(PKG_VERSION)-${PKG_RELEASE}))

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
