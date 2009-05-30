# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		xf86-video-geode
PKG_VERSION:=		2.11.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		dc9cbe88f38f82e27dbfb66f9f99fc98
MASTER_SITES:=		http://xorg.freedesktop.org/releases/individual/driver/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XF86_VIDEO_GEODE,${PKG_NAME},$(PKG_VERSION)-$(PKG_RELEASE)))

CONFIGURE_STYLE=	gnu
BUILD_STYLE=		auto
INSTALL_STYLE=		auto

post-install:
	${INSTALL_DIR} ${IDIR_XF86_VIDEO_GEODE}/usr/lib/xorg/modules/drivers
	${CP} ${WRKINST}/usr/lib/xorg/modules/drivers/*.so \
		${IDIR_XF86_VIDEO_GEODE}/usr/lib/xorg/modules/drivers/

include ${TOPDIR}/mk/pkg-bottom.mk
