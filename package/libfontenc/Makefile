# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libfontenc
PKG_VERSION:=		1.0.4
PKG_RELEASE:=		1
PKG_MD5SUM:=		b7bb0887b702ab03251fd9fc361d0c58
PKG_DESCR:=		helps font libraries portably determine and deal with different encodings of fonts
PKG_SECTION:=		x11
PKG_SITES:=		${MASTER_SITE_XORG}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBFONTENC,libfontenc,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE=	gnu
BUILD_STYLE=		auto
INSTALL_STYLE=		auto confprog

post-install:
	${INSTALL_DIR} ${IDIR_LIBFONTENC}/usr/lib
	${CP} ${WRKINST}/usr/lib/libfontenc.so* ${IDIR_LIBFONTENC}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
