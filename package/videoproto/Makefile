# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		videoproto
PKG_VERSION:=		2.3.1
PKG_RELEASE:=		1
PKG_DESCR:=		X11 video protocol headers
PKG_SECTION:=		x11/devel
PKG_MD5SUM:=		f1903057310c6b308edf0e982d33714d
PKG_SITES:=		${MASTER_SITE_XORG}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,VIDEOPROTO,videoproto,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

post-install:
	${INSTALL_DIR} ${IDIR_VIDEOPROTO}/usr/include
	${CP} ${WRKINST}/usr/include/X11 ${IDIR_VIDEOPROTO}/usr/include
	${INSTALL_DIR} ${IDIR_VIDEOPROTO}/usr/lib/pkgconfig
	${INSTALL_DATA} ${WRKINST}/usr/lib/pkgconfig/videoproto.pc \
		${IDIR_VIDEOPROTO}/usr/lib/pkgconfig

include ${TOPDIR}/mk/pkg-bottom.mk
