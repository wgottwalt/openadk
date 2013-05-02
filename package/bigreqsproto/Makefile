# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		bigreqsproto
PKG_VERSION:=		1.1.2
PKG_RELEASE:=		1
PKG_DESCR:=		Big Requests Extension headers
PKG_SECTION:=		x11/devel
PKG_MD5SUM:=		9b83369ac7a5eb2bf54c8f34db043a0e
PKG_SITES:=		${MASTER_SITE_XORG}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,BIGREQSPROTO,bigreqsproto,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

post-install:
	${INSTALL_DIR} ${IDIR_BIGREQSPROTO}/usr/include
	${CP} ${WRKINST}/usr/include/X11 ${IDIR_BIGREQSPROTO}/usr/include
	${INSTALL_DIR} ${IDIR_BIGREQSPROTO}/usr/lib/pkgconfig
	${INSTALL_DATA} ${WRKINST}/usr/lib/pkgconfig/bigreqsproto.pc \
		${IDIR_BIGREQSPROTO}/usr/lib/pkgconfig

include ${TOPDIR}/mk/pkg-bottom.mk
