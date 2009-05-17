# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libaudiofile
PKG_VERSION:=		0.2.6
PKG_RELEASE:=		2
PKG_MD5SUM:=		460f848ce5f4a33ae66b15a4fb7720ec
MASTER_SITES:=		http://www.freewrt.org/distfiles/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBAUDIOFILE,libaudiofile,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

CONFIGURE_STYLE=	gnu
CONFIGURE_ENV+=		ac_cv_linux_vers=2
CONFIGURE_ARGS+=	--with-build-cc=${HOSTCC}
BUILD_STYLE=		auto
INSTALL_STYLE=		auto

post-install:
	${INSTALL_DIR} ${IDIR_LIBAUDIOFILE}/usr/lib
	${CP} ${WRKINST}/usr/lib/libaudiofile.so.* ${IDIR_LIBAUDIOFILE}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
