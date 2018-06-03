# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		libmpc
PKG_VERSION:=		1.1.0
PKG_RELEASE:=		1
PKG_HASH:=		6985c538143c1208dcb1ac42cedad6ff52e267b47e5f970183a3e75125b43c2e
PKG_DESCR:=		multiprecision arithmetic library
PKG_SECTION:=		libs/misc
PKG_BUILDDEP:=		gmp mpfr
PKG_URL:=		http://www.multiprecision.org/
PKG_SITES:=		https://ftp.gnu.org/gnu/mpc/
PKG_LIBNAME:=		libmpc
PKG_OPTS:=		dev

DISTFILES:=		mpc-${PKG_VERSION}.tar.gz
WRKDIST=		$(WRKDIR)/mpc-$(PKG_VERSION)

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBMPC,libmpc,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

libmpc-install:
	${INSTALL_DIR} ${IDIR_LIBMPC}/usr/lib
	${CP} ${WRKINST}/usr/lib/libmpc.so* ${IDIR_LIBMPC}/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
