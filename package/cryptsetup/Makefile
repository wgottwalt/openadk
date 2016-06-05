# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		cryptsetup
PKG_VERSION:=		1.7.2
PKG_RELEASE:=		1
PKG_HASH:=		dbb35dbf5f0c1749168c86c913fe98e872247bfc8425314b494c2423e7e43342
PKG_DESCR:=		utility used to conveniently setup disk encryption 
PKG_SECTION:=		app/crypto
PKG_DEPENDS:=		libgcrypt device-mapper libuuid libpopt
PKG_DEPENDS:=		libgcrypt device-mapper libuuid libpopt
PKG_BUILDDEP:=		libgcrypt popt e2fsprogs lvm
PKG_URL:=		https://gitlab.com/cryptsetup/cryptsetup
PKG_SITES:=		https://www.kernel.org/pub/linux/utils/cryptsetup/v1.7/
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
