# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		jpeg
PKG_VERSION:=		6b
PKG_RELEASE:=		1
PKG_MD5SUM:=		dbd5f3b47ed13132f04c685d608a7547
PKG_DESCR:=		The Independent JPEG Groups JPEG runtime library
PKG_SECTION:=		libs
PKG_URL:=		http://sourceforge.net/projects/libjpeg
PKG_SITES:=		http://www.ijg.org/files/ \
			ftp://ftp.uu.net/graphics/jpeg/

DISTFILES:=		${PKG_NAME}src.v${PKG_VERSION}.tar.gz

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBJPEG,libjpeg,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE:=	gnu
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto
FAKE_FLAGS+=		prefix="${WRKINST}/usr" \
			exec_prefix="${WRKINST}/usr"
INSTALL_TARGET:=	install-headers install-lib

pre-build:
	mkdir -p ${WRKINST}/usr/{include,lib}

post-install:
	${INSTALL_DIR} ${IDIR_LIBJPEG}/usr/lib
	${CP} ${WRKINST}/usr/lib/libjpeg.so* ${IDIR_LIBJPEG}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
