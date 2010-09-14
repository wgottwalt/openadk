# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		xtrans
PKG_VERSION:=		1.2.5
PKG_RELEASE:=		1
PKG_MD5SUM:=		b2f47d49faf1f24e8294b624b21b9b93
PKG_SITES:=		${MASTER_SITE_XORG}
PKG_SUBPKGS:=

include $(TOPDIR)/mk/package.mk

CONFIGURE_ARGS+=	--datadir=/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
