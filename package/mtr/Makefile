# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		mtr
PKG_VERSION:=		0.75
PKG_RELEASE:=		2
PKG_MD5SUM:=		23baca52d0922c2ecba7eba05317868c
PKG_DESCR:=		ncurses traceroute/ping tool
PKG_SECTION:=		net
PKG_DEPENDS:=		libncurses
PKG_BUILDDEP:=		ncurses
PKG_URL:=		http://www.bitwizard.nl/mtr/
PKG_SITES:=		ftp://ftp.bitwizard.nl/mtr/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_LIBC_DEPENDS:=	uclibc glibc

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,MTR,mtr,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TARGET_LDFLAGS+=	-ltinfo
CONFIGURE_ENV+=		ac_cv_lib_resolv_res_mkquery=yes
CONFIGURE_ARGS+=	--without-gtk

mtr-install:
	${INSTALL_DIR} ${IDIR_MTR}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/mtr ${IDIR_MTR}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
