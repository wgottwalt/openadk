# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		p910nd
PKG_VERSION:=		0.7
PKG_RELEASE:=		10
PKG_MD5SUM:=		7bf752532d26c9106f8039db95df3a6b
PKG_DESCR:=		small non-spooling printer server
PKG_SECTION:=		net/misc
PKG_URL:=		http://www.etherboot.org/p910nd/
PKG_SITES:=		http://www.etherboot.org/p910nd/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,P910ND,p910nd,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
INSTALL_STYLE:=		manual

MAKE_FLAGS+=		${TARGET_CONFIGURE_OPTS} \
			CFLAGS="${TARGET_CFLAGS} -DLOCKFILE_DIR=\"\\\"/tmp\\\"\""
ALL_TARGET:=

do-install:
	${INSTALL_DIR} ${IDIR_P910ND}/usr/sbin
	${INSTALL_BIN} ${WRKBUILD}/p910nd ${IDIR_P910ND}/usr/sbin

include ${TOPDIR}/mk/pkg-bottom.mk
