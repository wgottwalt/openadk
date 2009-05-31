# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		irssi
PKG_VERSION:=		0.8.13
PKG_RELEASE:=		1
PKG_MD5SUM:=		0d6fc2203832b514eff014fffd574664
PKG_DESCR:=		IRC text client
PKG_SECTION:=		text
PKG_DEPENDS:=		glib libncurses
PKG_URL:=		http://www.irssi.org
PKG_SITES:=		http://www.irssi.org/files/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${TOPDIR}/mk/package.mk

ifeq (${ADK_PACKAGE_IRSSI_SSL},y)
PKG_DEPENDS+=		libopenssl
endif

$(eval $(call PKG_template,IRSSI,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE=	gnu
CONFIGURE_ARGS+=	--with-perl=no \
			--with-gnu-ld \
			--with-textui \
			--with-terminfo \
			--without-bot \
			--without-proxy \
			--enable-static
BUILD_STYLE=		auto

ifeq (${ADK_PACKAGE_IRSSI_SSL},y)
CONFIGURE_ARGS+=	--enable-ssl
else
CONFIGURE_ARGS+=	--disable-ssl
endif

do-install:
	${INSTALL_DIR} ${IDIR_IRSSI}/usr/bin
	${INSTALL_BIN} ${WRKBUILD}/src/fe-text/${PKG_NAME} ${IDIR_IRSSI}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
