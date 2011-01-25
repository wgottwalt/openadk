# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		compositeproto
PKG_VERSION:=		0.4.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		6994a209774fe7877fd8e0c9fafe2466
PKG_DESCR:=		X11 composite headers
PKG_SECTION:=		x11/devel
PKG_SITES:=		${MASTER_SITE_XORG}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,COMPOSITEPROTO,compositeproto,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

post-install:
	${INSTALL_DIR} ${IDIR_COMPOSITEPROTO}/usr/include
	${CP} ${WRKINST}/usr/include/X11 ${IDIR_COMPOSITEPROTO}/usr/include

include ${TOPDIR}/mk/pkg-bottom.mk
