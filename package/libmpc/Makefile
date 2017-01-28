# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		libmpc
PKG_VERSION:=		1.0.3
PKG_RELEASE:=		1
PKG_HASH:=		617decc6ea09889fb08ede330917a00b16809b8db88c29c31bfbb49cbf88ecc3
PKG_DESCR:=		multiprecision arithmetic library
PKG_SECTION:=		libs/misc
PKG_BUILDDEP:=		gmp mpfr
PKG_URL:=		http://www.multiprecision.org/
PKG_SITES:=		http://www.multiprecision.org/mpc/download/
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
