# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libaudiofile
PKG_VERSION:=		0.2.6
PKG_RELEASE:=		2
PKG_MD5SUM:=		460f848ce5f4a33ae66b15a4fb7720ec
PKG_DESCR:=		audiofile library
PKG_SECTION:=		libs
PKG_URL:=		http://www.68k.org/~michael/audiofile
PKG_SITES:=		http://www.openadk.org/distfiles/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBAUDIOFILE,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ENV+=		ac_cv_linux_vers=2
CONFIGURE_ARGS+=	--with-build-cc=${HOSTCC}

post-install:
	${INSTALL_DIR} ${IDIR_LIBAUDIOFILE}/usr/lib
	${CP} ${WRKINST}/usr/lib/libaudiofile.so* ${IDIR_LIBAUDIOFILE}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
