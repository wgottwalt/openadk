# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		faad2
PKG_VERSION:=		2.7
PKG_RELEASE:=		1
PKG_MD5SUM:=		ee1b4d67ea2d76ee52c5621bc6dbf61e
PKG_DESCR:=		A MP4 decoding library
PKG_SECTION:=		libs
PKG_URL:=		http://sourceforge.net/projects/faac/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=faac/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBFAAD2,libfaad2,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--without-mpeg4ip \
			--without-xmms

post-install:
	${INSTALL_DIR} ${IDIR_LIBFAAD2}/usr/lib
	${CP} ${WRKINST}/usr/lib/libfaad.so* ${IDIR_LIBFAAD2}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
