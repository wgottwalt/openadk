# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		recordproto
PKG_VERSION:=		1.14.1
PKG_RELEASE:=		1
PKG_DESCR:=		X headers
PKG_SECTION:=		x11/devel
PKG_MD5SUM:=		a558e1c6f67871e3fb94d65d67eb2f3b
PKG_SITES:=		${MASTER_SITE_XORG}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,RECORDPROTO,recordproto,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

post-install:
	${INSTALL_DIR} ${IDIR_RECORDPROTO}/usr/include
	${CP} ${WRKINST}/usr/include/X11 ${IDIR_RECORDPROTO}/usr/include

include ${TOPDIR}/mk/pkg-bottom.mk
