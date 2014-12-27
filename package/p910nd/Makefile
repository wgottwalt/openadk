# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		p910nd
PKG_VERSION:=		0.97
PKG_RELEASE:=		1
PKG_HASH:=		4ac980a3ae24babae6f70f0a692625ece03a4a92c357fbb10d2e368386c3c26f
PKG_DESCR:=		small non-spooling printer server
PKG_SECTION:=		net/misc
PKG_URL:=		http://p910nd.sourceforge.net/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=p910nd/}

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,P910ND,p910nd,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
INSTALL_STYLE:=		manual

MAKE_FLAGS+=		${TARGET_CONFIGURE_OPTS} \
			CFLAGS="${TARGET_CFLAGS} -DLOCKFILE_DIR=\"\\\"/tmp\\\"\""
ALL_TARGET:=

do-install:
	${INSTALL_DIR} ${IDIR_P910ND}/usr/sbin
	${INSTALL_BIN} ${WRKBUILD}/p910nd ${IDIR_P910ND}/usr/sbin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
