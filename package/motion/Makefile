# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		motion
PKG_VERSION:=		3.2.12
PKG_RELEASE:=		1
PKG_MD5SUM:=		1ba0065ed50509aaffb171594c689f46
PKG_DESCR:=		Webcam motion sensing and logging
PKG_SECTION:=		multimedia
PKG_DEPENDS:=		libjpeg libpthread
PKG_BUILDDEP:=		jpeg
PKG_URL:=		http://www.lavrsen.dk/twiki/bin/view/Motion/WebHome
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=motion/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,MOTION,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--without-ffmpeg \
			--without-jpeg-mmx \
			--without-optimizecpu \
			--without-mysql \
			--without-pgsql \
			--without-v4l

post-install:
	${INSTALL_DIR} ${IDIR_MOTION}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/motion ${IDIR_MOTION}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
