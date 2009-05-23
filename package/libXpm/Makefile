# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libXpm
PKG_VERSION:=		3.5.7
PKG_RELEASE:=		1
PKG_MD5SUM:=		7bbc8f112f7143ed6961a58ce4e14558
MASTER_SITES:=		${MASTER_SITE_XORG}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBXPM,libxpm,$(PKG_VERSION)-$(PKG_RELEASE)))

CONFIGURE_STYLE=	gnu
BUILD_STYLE=		auto
INSTALL_STYLE=		auto confprog
TCFLAGS+=		-lintl

post-install:
	${INSTALL_DIR} ${IDIR_LIBXPM}/usr/lib
	${CP} ${WRKINST}/usr/lib/libXpm.so* ${IDIR_LIBXPM}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
