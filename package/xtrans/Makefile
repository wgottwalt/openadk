# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		xtrans
PKG_VERSION:=		1.2.6
PKG_RELEASE:=		1
PKG_DESCR:=		X11 network protocol transport library
PKG_SECTION:=		x11/devel
PKG_MD5SUM:=		b91dd22b77a350d129a81175cd8c58cc
PKG_SITES:=		${MASTER_SITE_XORG}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XTRANS,xtrans,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_ARGS+=	--datadir=/usr/lib

post-install:
	${INSTALL_DIR} ${IDIR_XTRANS}/usr/include
	${CP} ${WRKINST}/usr/include/X11 ${IDIR_XTRANS}/usr/include
	${INSTALL_DIR} ${IDIR_XTRANS}/usr/lib/pkgconfig
	${INSTALL_DATA} ${WRKINST}/usr/lib/pkgconfig/xtrans.pc \
		${IDIR_XTRANS}/usr/lib/pkgconfig

include ${TOPDIR}/mk/pkg-bottom.mk
