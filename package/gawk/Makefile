# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		gawk
PKG_VERSION:=		4.0.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		a42be7536a62d0bcb99ca92467d61660
PKG_DESCR:=		GNU awk
PKG_SECTION:=		lang
PKG_URL:=		http://www.gnu.org/software/gawk/
PKG_SITES:=		${MASTER_SITE_GNU:=gawk/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,GAWK,gawk,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--disable-libsigsegv

gawk-install:
	${INSTALL_DIR} ${IDIR_GAWK}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/gawk ${IDIR_GAWK}/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
