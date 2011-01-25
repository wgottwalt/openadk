# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		fixesproto
PKG_VERSION:=		4.1.2
PKG_RELEASE:=		1
PKG_DESCR:=		XFIXES Extension headers
PKG_SECTION:=		x11/devel
PKG_MD5SUM:=		352e7ea8278bc31a8d75b31232a61cd4
PKG_SITES:=		${MASTER_SITE_XORG}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,FIXESPROTO,fixesproto,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

post-install:
	${INSTALL_DIR} ${IDIR_FIXESPROTO}/usr/include
	${CP} ${WRKINST}/usr/include/X11 ${IDIR_FIXESPROTO}/usr/include

include ${TOPDIR}/mk/pkg-bottom.mk
