# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		glproto
PKG_VERSION:=		1.4.17
PKG_RELEASE:=		1
PKG_DESCR:=		OpenGL headers
PKG_SECTION:=		devel
PKG_MD5SUM:=		d69554c1b51a83f2c6976a640819911b
PKG_SITES:=		${MASTER_SITE_XORG}
PKG_OPTS:=		dev devonly

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,GLPROTO,glproto,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

include ${TOPDIR}/mk/pkg-bottom.mk
