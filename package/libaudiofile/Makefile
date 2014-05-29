# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		audiofile
PKG_VERSION:=		0.3.6
PKG_RELEASE:=		2
PKG_MD5SUM:=		2731d79bec0acef3d30d2fc86b0b72fd
PKG_DESCR:=		audiofile library
PKG_SECTION:=		libs/audio
PKG_URL:=		http://audiofile.68k.org/
PKG_BUILDDEP:=		flac
PKG_DEPENDS:=		libflac
PKG_SITES:=		http://audiofile.68k.org/
PKG_LIBNAME:=		libaudiofile
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBAUDIOFILE,libaudiofile,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_ENV+=		ac_cv_linux_vers=2
TARGET_CPPFLAGS+=       -D_GNU_SOURCE -D_POSIX_SOURCE

libaudiofile-install:
	${INSTALL_DIR} ${IDIR_LIBAUDIOFILE}/usr/lib
	${CP} ${WRKINST}/usr/lib/libaudiofile.so* ${IDIR_LIBAUDIOFILE}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
