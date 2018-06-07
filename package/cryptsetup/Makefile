# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		cryptsetup
PKG_VERSION:=		2.0.3
PKG_RELEASE:=		1
PKG_HASH:=		4d6cca04c1f5ff4a68d045d190efb2623087eda0274ded92f92a4b6911e501d4
PKG_DESCR:=		utility used to conveniently setup disk encryption 
PKG_SECTION:=		app/crypto
PKG_DEPENDS:=		libgcrypt device-mapper libuuid libpopt json-c libncurses
PKG_BUILDDEP:=		libgcrypt popt e2fsprogs lvm json-c ncurses
PKG_URL:=		https://gitlab.com/cryptsetup/cryptsetup
PKG_SITES:=		https://www.kernel.org/pub/linux/utils/cryptsetup/v2.0/
PKG_OPTS:=		dev

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,CRYPTSETUP,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_ARGS+=	--disable-selinux

cryptsetup-install:
	${INSTALL_DIR} ${IDIR_CRYPTSETUP}/usr/sbin ${IDIR_CRYPTSETUP}/usr/lib
	${CP} ${WRKINST}/usr/lib/libcryptsetup.so* \
		${IDIR_CRYPTSETUP}/usr/lib
	${INSTALL_BIN} ${WRKINST}/usr/sbin/cryptsetup \
		${IDIR_CRYPTSETUP}/usr/sbin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
