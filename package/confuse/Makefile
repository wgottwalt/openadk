# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		confuse
PKG_VERSION:=		2.7
PKG_RELEASE:=		2
PKG_HASH:=		e32574fd837e950778dac7ade40787dd2259ef8e28acd6ede6847ca895c88778
PKG_DESCR:=		configuration file parser library
PKG_SECTION:=		libs/misc
PKG_URL:=		http://www.nongnu.org/confuse/
PKG_SITES:=		http://savannah.nongnu.org/download/confuse/
PKG_LIBNAME:=		libconfuse
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBCONFUSE,libconfuse,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

libconfuse-install:
	${INSTALL_DIR} ${IDIR_LIBCONFUSE}/usr/lib
	${CP} ${WRKINST}/usr/lib/libconfuse.so* ${IDIR_LIBCONFUSE}/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
