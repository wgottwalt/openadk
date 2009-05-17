# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		links
PKG_VERSION:=		2.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		c9937f9ed0061f264973182f871fb667
MASTER_SITES:=		http://links.twibright.com/download/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LINKS,links,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

CONFIGURE_STYLE:=	gnu
CONFIGURE_ARGS+=	--enable-graphics \
			--with-ssl \
			--without-svgalib \
			--without-x \
			--without-directfb \
			--without-pmshell \
			--without-atheos
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_LINKS}/usr/bin
	${CP} ${WRKINST}/usr/bin/* ${IDIR_LINKS}/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
