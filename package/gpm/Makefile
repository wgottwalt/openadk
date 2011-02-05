# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		gpm
PKG_VERSION:=		1.20.6
PKG_RELEASE:=		1
PKG_MD5SUM:=		b75e794bfb9fe8114d0b083932673b8f
PKG_DESCR:=		console mouse support
PKG_SECTION:=		misc
PKG_URL:=		http://launchpad.net/gpm
PKG_SITES:=		http://launchpad.net/gpm/main/${PKG_VERSION}/+download/
PKG_NOPARALLEL:=	1

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,GPM,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TARGET_CPPFLAGS+=	-I${WRKSRC}/src/headers

post-install:
	${INSTALL_DIR} ${IDIR_GPM}/usr/sbin ${IDIR_GPM}/usr/lib
	${INSTALL_BIN} ${WRKINST}/usr/sbin/gpm ${IDIR_GPM}/usr/sbin/
	${CP} ${WRKINST}/usr/lib/libgpm.so.* ${IDIR_GPM}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
