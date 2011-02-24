# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		damageproto
PKG_VERSION:=		1.2.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		423516fd64e43e8671120056b0d9f597
PKG_DESCR:=		X DAMAGE Extension headers
PKG_SECTION:=		x11/devel
PKG_SITES:=		${MASTER_SITE_XORG}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,DAMAGEPROTO,damageproto,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

post-install:
	${INSTALL_DIR} ${IDIR_DAMAGEPROTO}/usr/include
	${CP} ${WRKINST}/usr/include/X11 ${IDIR_DAMAGEPROTO}/usr/include
	${INSTALL_DIR} ${IDIR_DAMAGEPROTO}/usr/lib/pkgconfig
	${INSTALL_DATA} ${WRKINST}/usr/lib/pkgconfig/damageproto.pc \
		${IDIR_DAMAGEPROTO}/usr/lib/pkgconfig

include ${TOPDIR}/mk/pkg-bottom.mk
