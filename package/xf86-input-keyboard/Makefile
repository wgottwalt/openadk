# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		xf86-input-keyboard
PKG_VERSION:=		1.4.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		fc836be5364d80604cb11f4daacceb23
PKG_DESCR:=		X11 driver for keyboard 
PKG_SECTION:=		x11/drivers
PKG_BUILDDEP+=		xorg-server
PKG_DEPENDS:=		xorg-server
PKG_SITES:=		${MASTER_SITE_XORG}

PKG_TARGET_DEPENDS:=	alix1c lemote ibmx40 shuttle

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XF86_INPUT_KEYBOARD,${PKG_NAME},$(PKG_VERSION)-$(PKG_RELEASE),${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

post-install:
	${INSTALL_DIR} ${IDIR_XF86_INPUT_KEYBOARD}/usr/lib/xorg/modules/input
	${CP} ${WRKINST}/usr/lib/xorg/modules/input/kbd_drv.so \
		${IDIR_XF86_INPUT_KEYBOARD}/usr/lib/xorg/modules/input/

include ${TOPDIR}/mk/pkg-bottom.mk
