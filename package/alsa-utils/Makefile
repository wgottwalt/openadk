# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		alsa-utils
PKG_VERSION:=		1.0.27.2
PKG_RELEASE:=		2
PKG_MD5SUM:=		b65e9a04181bd7c9db7667a4566f8dc3
PKG_DESCR:=		mixer/player utility
PKG_SECTION:=		multimedia
PKG_DEPENDS:=		alsa-lib libpthread libgcc librt
PKG_BUILDDEP:=		alsa-lib
PKG_URL:=		http://www.alsa-project.org/
PKG_SITES:=		ftp://ftp.alsa-project.org/pub/utils/

PKG_FLAVOURS_ALSA_UTILS:=WITH_ALSAMIXER
PKGFS_WITH_ALSAMIXER:=	libncurses
PKGFD_WITH_ALSAMIXER:=	include alsamixer ncurses applet
PKGFB_WITH_ALSAMIXER:=	ncurses

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,ALSA_UTILS,alsa-utils,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TARGET_CPPFLAGS+=	-D_GNU_SOURCE -D_POSIX_SOURCE
CONFIGURE_ARGS+=	--disable-xmlto
ifeq (${ADK_PACKAGE_ALSA_UTILS_WITH_ALSAMIXER},y)
CONFIGURE_ARGS+=	--enable-alsamixer
else
CONFIGURE_ARGS+=	--disable-alsamixer
endif

alsa-utils-install:
	${INSTALL_DIR} ${IDIR_ALSA_UTILS}/usr/bin
	${CP} ${WRKINST}/usr/bin/{aplay,amixer} ${IDIR_ALSA_UTILS}/usr/bin
ifeq (${ADK_PACKAGE_ALSA_UTILS_WITH_ALSAMIXER},y)
	${INSTALL_BIN} ${WRKINST}/usr/bin/alsamixer \
		${IDIR_ALSA_UTILS}/usr/bin
endif

include ${TOPDIR}/mk/pkg-bottom.mk
