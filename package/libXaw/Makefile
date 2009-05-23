# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libXaw
PKG_VERSION:=		1.0.4
PKG_RELEASE:=		1
PKG_MD5SUM:=		d27375737f323849cf7ca2fa8566afa5
MASTER_SITES:=		${MASTER_SITE_XORG}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBXAW,libxaw,$(PKG_VERSION)-$(PKG_RELEASE)))

CONFIGURE_STYLE=	gnu
BUILD_STYLE=		auto
INSTALL_STYLE=		auto confprog

post-install:
	${INSTALL_DIR} ${IDIR_LIBXAW}/usr/lib
	${CP} ${WRKINST}/usr/lib/libXaw.so* ${IDIR_LIBXAW}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
