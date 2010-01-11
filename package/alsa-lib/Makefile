# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		alsa-lib
PKG_VERSION:=		1.0.22
PKG_RELEASE:=		1
PKG_MD5SUM:=		b28a12348905fb6915bc41f0edb2ecce
PKG_DESCR:=		ALSA sound library
PKG_SECTION:=		libs
PKG_URL:=		http://www.alsa-project.org
PKG_SITES:=		ftp://ftp.task.gda.pl/pub/linux/misc/alsa/lib/ \
			ftp://ftp.alsa-project.org/pub/lib/

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,ALSA_LIB,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE:=	gnu
CONFIGURE_ARGS+=	--disable-python
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_ALSA_LIB}/usr/lib ${IDIR_ALSA_LIB}/usr/share/alsa
	${CP} ${WRKINST}/usr/lib/libasound.so.* ${IDIR_ALSA_LIB}/usr/lib/
	${CP} ${WRKINST}/usr/share/alsa/* ${IDIR_ALSA_LIB}/usr/share/alsa/

include ${TOPDIR}/mk/pkg-bottom.mk
