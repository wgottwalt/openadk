# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		alsa-lib
PKG_VERSION:=		1.0.28
PKG_RELEASE:=		6
PKG_HASH:=		3c074b85dde1b30e78ef4995579765833e5b693fbbd8f834c335e080cb734a6d
PKG_DESCR:=		sound library
PKG_SECTION:=		libs/audio
PKG_URL:=		http://www.alsa-project.org/
PKG_SITES:=		ftp://ftp.alsa-project.org/pub/lib/
PKG_OPTS:=		dev

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${ADK_TOPDIR}/mk/host.mk
include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call HOST_template,ALSA_LIB,alsa-lib,${PKG_VERSION}-${PKG_RELEASE}))
$(eval $(call PKG_template,ALSA_LIB,alsa-lib,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

AUTOTOOL_STYLE:=	autoreconf

ifneq ($(ADK_HOST_LINUX),y)
HOST_LINUX_ONLY:=	1
endif

TARGET_CPPFLAGS+=	-D_POSIX_C_SOURCE=1
HOST_STYLE:=		auto
CONFIGURE_ARGS+=	--disable-python

alsa-lib-install:
	${INSTALL_DIR} ${IDIR_ALSA_LIB}/usr/lib 
	${INSTALL_DIR} ${IDIR_ALSA_LIB}/usr/share/alsa
	${CP} ${WRKINST}/usr/lib/libasound.so* ${IDIR_ALSA_LIB}/usr/lib
	${CP} ${WRKINST}//usr/share/alsa/* \
		${IDIR_ALSA_LIB}/usr/share/alsa

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
