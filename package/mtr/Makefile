# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		mtr
PKG_VERSION:=		0.75
PKG_RELEASE:=		2
PKG_HASH:=		1d1a5de6b233289bf17a21e3bf83c82db47d22bb269af986229b788689e1f0f3
PKG_DESCR:=		traceroute/ping tool
PKG_SECTION:=		net/debug
PKG_DEPENDS:=		libncurses
PKG_BUILDDEP:=		ncurses
PKG_URL:=		http://www.bitwizard.nl/mtr/
PKG_SITES:=		ftp://ftp.bitwizard.nl/mtr/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_LIBC_DEPENDS:=	uclibc-ng glibc

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,MTR,mtr,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TARGET_LDFLAGS+=	-ltinfo
CONFIGURE_ENV+=		ac_cv_lib_resolv_res_mkquery=yes
CONFIGURE_ARGS+=	--without-gtk

mtr-install:
	${INSTALL_DIR} ${IDIR_MTR}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/mtr ${IDIR_MTR}/usr/sbin/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
