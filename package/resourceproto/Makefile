# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		resourceproto
PKG_VERSION:=		1.1.0
PKG_RELEASE:=		1
PKG_DESCR:=		Resource extension headers
PKG_SECTION:=		x11/devel
PKG_MD5SUM:=		587333b4995a3e11ebe4c8ba2742efaf
PKG_SITES:=		${MASTER_SITE_XORG}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,RESOURCEPROTO,resourceproto,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

post-install:
	${INSTALL_DIR} ${IDIR_RESOURCEPROTO}/usr/include
	${CP} ${WRKINST}/usr/include/X11 ${IDIR_RESOURCEPROTO}/usr/include
	${INSTALL_DIR} ${IDIR_RESOURCEPROTO}/usr/lib/pkgconfig
	${INSTALL_DATA} ${WRKINST}/usr/lib/pkgconfig/resourceproto.pc \
		${IDIR_RESOURCEPROTO}/usr/lib/pkgconfig

include ${TOPDIR}/mk/pkg-bottom.mk
