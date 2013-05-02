# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		fixesproto
PKG_VERSION:=		5.0
PKG_RELEASE:=		1
PKG_DESCR:=		XFIXES Extension headers
PKG_SECTION:=		x11/devel
PKG_MD5SUM:=		1b3115574cadd4cbea1f197faa7c1de4
PKG_SITES:=		${MASTER_SITE_XORG}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,FIXESPROTO,fixesproto,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

post-install:
	${INSTALL_DIR} ${IDIR_FIXESPROTO}/usr/include
	${CP} ${WRKINST}/usr/include/X11 ${IDIR_FIXESPROTO}/usr/include
	${INSTALL_DIR} ${IDIR_FIXESPROTO}/usr/lib/pkgconfig
	${CP} ${WRKINST}/usr/lib/pkgconfig/fixesproto.pc \
		${IDIR_FIXESPROTO}/usr/lib/pkgconfig

include ${TOPDIR}/mk/pkg-bottom.mk
