# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		evieext
PKG_VERSION:=		1.1.0
PKG_RELEASE:=		2
PKG_MD5SUM:=		68e61ce53caa495a3ad4085f66010eb8
PKG_DESCR:=		collection of xevie extension headers
PKG_SECTION:=		dev/header
PKG_SITES:=		ftp://ftp.x.org/pub/individual/proto/
PKG_OPTS:=              dev devonly

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,EVIEEXT,evieext,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

include ${TOPDIR}/mk/pkg-bottom.mk
