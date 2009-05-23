# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libXfont
PKG_VERSION:=		1.3.3
PKG_RELEASE:=		1
PKG_MD5SUM:=		cb202f7b1af5fc95a7f35f0a62e52e6e
MASTER_SITES:=		${MASTER_SITE_XORG}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBXFONT,libxfont,$(PKG_VERSION)-$(PKG_RELEASE)))

CONFIGURE_STYLE=	gnu
BUILD_STYLE=		auto
INSTALL_STYLE=		auto confprog

post-install:
	${INSTALL_DIR} ${IDIR_LIBXFONT}/usr/lib
	${CP} ${WRKINST}/usr/lib/libXfont.so* ${IDIR_LIBXFONT}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
