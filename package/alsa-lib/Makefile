# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		alsa-lib
PKG_VERSION:=		1.0.27.2
PKG_RELEASE:=		3
PKG_MD5SUM:=		69129a7c37697f81ac092335e9fa452b
PKG_DESCR:=		sound library
PKG_SECTION:=		libs/audio
PKG_BUILDDEP:=		alsa-lib-host
PKG_URL:=		http://www.alsa-project.org/
PKG_SITES:=		ftp://ftp.alsa-project.org/pub/lib/
PKG_OPTS:=		dev

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${TOPDIR}/mk/host.mk
include ${TOPDIR}/mk/package.mk

$(eval $(call HOST_template,ALSA_LIB,alsa-lib,${PKG_VERSION}-${PKG_RELEASE}))
$(eval $(call PKG_template,ALSA_LIB,alsa-lib,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

ifneq ($(ADK_HOST_LINUX),y)
HOST_LINUX_ONLY:=	1
endif

TARGET_CPPFLAGS+=	-D_POSIX_C_SOURCE=1
HOST_STYLE:=		auto
CONFIGURE_ARGS+=	--disable-python

alsa-lib-install:
	${INSTALL_DIR} ${IDIR_ALSA_LIB}/usr/lib ${IDIR_ALSA_LIB}/usr/share/alsa
	${CP} ${WRKINST}/usr/lib/libasound.so* ${IDIR_ALSA_LIB}/usr/lib
	${CP} ${WRKINST}/usr/share/alsa/* ${IDIR_ALSA_LIB}/usr/share/alsa

include ${TOPDIR}/mk/host-bottom.mk
include ${TOPDIR}/mk/pkg-bottom.mk
