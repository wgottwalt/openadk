# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		alsa-utils
PKG_VERSION:=		1.0.24.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		8238cd57cb301d1c36bcf0ecb59ce6b2
PKG_DESCR:=		ALSA mixer utility
PKG_SECTION:=		multimedia
PKG_DEPENDS:=		alsa-lib libpthread
PKG_BUILDDEP:=		alsa-lib
PKG_URL:=		http://www.alsa-project.org/
PKG_SITES:=		ftp://ftp.alsa-project.org/pub/utils/

PKG_FLAVOURS_ALSA_UTILS:=WITH_ALSAMIXER
PKGFS_WITH_ALSAMIXER:=	libncurses
PKGFD_WITH_ALSAMIXER:=	include alsamixer ncurses applet
PKGFB_WITH_ALSAMIXER:=	ncurses

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,ALSA_UTILS,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--disable-xmlto
ifeq (${ADK_PACKAGE_ALSA_UTILS_WITH_ALSAMIXER},y)
CONFIGURE_ARGS+=	--enable-alsamixer
else
CONFIGURE_ARGS+=	--disable-alsamixer
endif

post-install:
	${INSTALL_DIR} ${IDIR_ALSA_UTILS}/usr/bin
	${CP} ${WRKINST}/usr/bin/amixer ${IDIR_ALSA_UTILS}/usr/bin
ifeq (${ADK_PACKAGE_ALSA_UTILS_WITH_ALSAMIXER},y)
	${INSTALL_BIN} ${WRKINST}/usr/bin/alsamixer \
		${IDIR_ALSA_UTILS}/usr/bin
endif

include ${TOPDIR}/mk/pkg-bottom.mk
