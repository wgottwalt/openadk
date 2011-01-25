# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libICE
PKG_VERSION:=		1.0.7
PKG_RELEASE:=		1
PKG_MD5SUM:=		91ff02eb5af6073c2e014a5290e65f17
PKG_DESCR:=		Inter-Client Exchange library
PKG_SECTION:=		x11/libs
PKG_BUILDDEP:=		xtrans xproto
PKG_SITES:=		${MASTER_SITE_XORG}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBICE,libice,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

post-install:
	${INSTALL_DIR} ${IDIR_LIBICE}/usr/lib
	${CP} ${WRKINST}/usr/lib/libICE.so* ${IDIR_LIBICE}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
