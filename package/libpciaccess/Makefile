# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libpciaccess
PKG_VERSION:=		0.10.3
PKG_RELEASE:=		1
PKG_MD5SUM:=		3c4a7578cb63c63ccb1ebca87e10407f
MASTER_SITES:=		${MASTER_SITE_XORG}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBPCIACCESS,libpciaccess,$(PKG_VERSION)-$(PKG_RELEASE),$(ARCH)))

CONFIGURE_STYLE=	autotool gnu
BUILD_STYLE=		auto
INSTALL_STYLE=		auto confprog

post-install:
	${INSTALL_DIR} ${IDIR_LIBPCIACCESS}/usr/lib
	${CP} ${WRKINST}/usr/lib/libpciaccess.so* ${IDIR_LIBPCIACCESS}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
