# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		irssi
PKG_VERSION:=		0.8.12
PKG_RELEASE:=		1
PKG_MD5SUM:=		e407b557b3cfc7c91ce4de2571dd79cb
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2
MASTER_SITES:=		http://www.irssi.org/files/
PKG_DEPENDS:=		glib2, libncurses

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,IRSSI,irssi,${PKG_VERSION}-${PKG_RELEASE}))

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
PKG_DEPENDS:=		${PKG_DEPENDS}, openssl
else
CONFIGURE_ARGS+=	--disable-ssl
endif

do-install:
	${INSTALL_DIR} ${IDIR_IRSSI}/usr/bin
	${INSTALL_BIN} ${WRKBUILD}/src/fe-text/${PKG_NAME} ${IDIR_IRSSI}/usr/bin/
	echo 'Depends: ${PKG_DEPENDS}' >>${IDIR_IRSSI}/CONTROL/control

include ${TOPDIR}/mk/pkg-bottom.mk
