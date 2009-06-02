# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		gpm
PKG_VERSION:=		1.20.5
PKG_RELEASE:=		1
PKG_MD5SUM:=		3915bdd6bf947ef867752a30b4be2387
PKG_DESCR:=		console mouse support
PKG_SECTION:=		text
PKG_URL:=		http://unix.schottelius.org/gpm
PKG_SITES:=		http://unix.schottelius.org/gpm/archives/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,GPM,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE:=	gnu
TCFLAGS+=		-I${WRKSRC}/src/headers
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_GPM}/usr/sbin ${IDIR_GPM}/usr/lib
	${INSTALL_BIN} ${WRKINST}/usr/sbin/gpm ${IDIR_GPM}/usr/sbin/
	${CP} ${WRKINST}/usr/lib/libgpm.so.* ${IDIR_GPM}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
