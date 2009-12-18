# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		alsa-utils
PKG_VERSION:=		1.0.21
PKG_RELEASE:=		1
PKG_MD5SUM:=		3672287c2608040d111ce45495ba7602
PKG_DESCR:=		ALSA mixer utility
PKG_DEPENDS:=		alsa-lib
PKG_BUILDDEP:=		alsa-lib
PKG_SECTION:=		utils
PKG_URL:=		http://www.alsa-project.org
PKG_SITES:=		ftp://ftp.task.gda.pl/pub/linux/misc/alsa/utils/ \
			ftp://ftp.alsa-project.org/pub/utils/

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,ALSA_UTILS,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE:=	gnu
CONFIGURE_ARGS+=	--disable-alsamixer
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_ALSA_UTILS}/usr/bin 
	${CP} ${WRKINST}/usr/bin/amixer ${IDIR_ALSA_UTILS}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
