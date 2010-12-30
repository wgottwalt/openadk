# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libogg
PKG_VERSION:=		1.1.3
PKG_RELEASE:=		2
PKG_MD5SUM:=		eaf7dc6ebbff30975de7527a80831585
PKG_DESCR:=		The Ogg bitstream handling library
PKG_SECTION:=		libs
PKG_URL:=		http://www.xiph.org/ogg
PKG_SITES:=		http://downloads.xiph.org/releases/ogg/

PKG_SUBPKGS:=		LIBOGG LIBOGG_DEV
PKGSD_LIBOGG_DEV:=	development files for libogg
PKGSC_LIBOGG_DEV:=	devel

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBOGG,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBOGG_DEV,libogg-dev,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBOGG_DEV},${PKGSC_LIBOGG_DEV}))

SUB_INSTALLS-y:=
SUB_INSTALLS-m:=
SUB_INSTALLS-${ADK_PACKAGE_LIBOGG_DEV}+=	libogg-dev-install

post-install: ${SUB_INSTALLS-m} ${SUB_INSTALLS-y}
	${INSTALL_DIR} ${IDIR_LIBOGG}/usr/lib
	${CP} ${WRKINST}/usr/lib/libogg.so* ${IDIR_LIBOGG}/usr/lib/

libogg-dev-install:
	${INSTALL_DIR} ${IDIR_LIBOGG_DEV}/usr/include/ogg
	${CP} ${WRKINST}/usr/include/ogg/*.h ${IDIR_LIBOGG_DEV}/usr/include/ogg

include ${TOPDIR}/mk/pkg-bottom.mk
