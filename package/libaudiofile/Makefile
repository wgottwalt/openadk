# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		audiofile
PKG_VERSION:=		0.3.6
PKG_RELEASE:=		2
PKG_HASH:=		cdc60df19ab08bfe55344395739bb08f50fc15c92da3962fac334d3bff116965
PKG_DESCR:=		audiofile library
PKG_SECTION:=		libs/audio
PKG_URL:=		http://audiofile.68k.org/
PKG_BUILDDEP:=		flac
PKG_DEPENDS:=		libflac
PKG_SITES:=		http://audiofile.68k.org/
PKG_LIBNAME:=		libaudiofile
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBAUDIOFILE,libaudiofile,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

TARGET_CPPFLAGS+=       -D_GNU_SOURCE -D_POSIX_SOURCE

CONFIGURE_ENV+=		ac_cv_linux_vers=2
CONFIGURE_ARGS+=	--disable-examples

libaudiofile-install:
	${INSTALL_DIR} ${IDIR_LIBAUDIOFILE}/usr/lib
	${CP} ${WRKINST}/usr/lib/libaudiofile.so* ${IDIR_LIBAUDIOFILE}/usr/lib/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
