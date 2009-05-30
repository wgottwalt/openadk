# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		madplay
PKG_VERSION:=		0.15.2b
PKG_RELEASE:=		1
PKG_MD5SUM:=		6814b47ceaa99880c754c5195aa1aac1
PKG_DESCR:=		MPEG audio player in fixed point
PKG_SECTION:=		sound
PKG_DEPENDS:=		libid3tag libmad
PKG_URL:=		http://www.underbit.com/products/mad
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=mad/}  \
			ftp://ftp.mars.org/pub/mpeg/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,MADPLAY,madplay,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE:=	gnu
CONFIGURE_ENV+=		BUILD_CC="${TARGET_CC}" HOSTCC=${HOST_CC} \
			LIBS="-lz" \
			ac_cv_linux_vers=2 \
			td_cv_buggygetaddrinfo="no"
CONFIGURE_ARGS+=	--disable-debugging \
			--disable-profiling \
			--disable-experimental \
			--without-libiconv-prefix \
			--without-libintl-prefix \
			--without-esd \
			--with-alsa
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_MADPLAY}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/madplay ${IDIR_MADPLAY}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
