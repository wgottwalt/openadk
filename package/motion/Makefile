# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		motion
# actually a svn version from 25.06.2014 checkout
PKG_VERSION:=		4.0
PKG_RELEASE:=		2
PKG_HASH:=		ff2931b0af037da126fed3e496430944132528132e71473aae478ff2e7f78e0d
PKG_DESCR:=		webcam motion sensing and logging
PKG_SECTION:=		mm/video
PKG_DEPENDS:=		libjpeg-turbo libsdl
PKG_BUILDDEP:=		libjpeg-turbo sdl
PKG_NEEDS:=		threads
PKG_URL:=		http://www.lavrsen.dk/twiki/bin/view/Motion/WebHome
PKG_SITES:=		http://distfiles.openadk.org/

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,MOTION,motion,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--without-ffmpeg \
			--without-jpeg-mmx \
			--without-optimizecpu \
			--without-mysql \
			--without-sqlite \
			--without-pgsql \
			--with-v4l

motion-install:
	${INSTALL_DIR} ${IDIR_MOTION}/etc ${IDIR_MOTION}/usr/bin
	$(INSTALL_DATA) ./files/motion.conf ${IDIR_MOTION}/etc
	${INSTALL_BIN} ${WRKINST}/usr/bin/motion ${IDIR_MOTION}/usr/bin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
