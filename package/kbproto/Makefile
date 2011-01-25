# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		kbproto
PKG_VERSION:=		1.0.5
PKG_RELEASE:=		1
PKG_DESCR:=		X11 keyboard protocol headers
PKG_SECTION:=		x11/devel
PKG_MD5SUM:=		cb95bc6ffb2dfa27498aeb4663dee964
PKG_SITES:=		${MASTER_SITE_XORG}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,KBPROTO,kbproto,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

post-install:
	${INSTALL_DIR} ${IDIR_KBPROTO}/usr/include
	${CP} ${WRKINST}/usr/include/X11 ${IDIR_KBPROTO}/usr/include

include ${TOPDIR}/mk/pkg-bottom.mk
