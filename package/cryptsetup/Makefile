# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		cryptsetup
PKG_VERSION:=		1.3.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		1f5b5a9d538e8a3c191fb7dd85b9b013
PKG_DESCR:=		LUKS cryptsetup tools
PKG_SECTION:=		crypto
PKG_DEPENDS:=		libgcrypt device-mapper libuuid libpopt
PKG_DEPENDS+=		kmod-dm-crypt kmod-crypto-aes kmod-crypto-cbc
PKG_DEPENDS+=		kmod-crypto-sha256 kmod-blk-dev-dm
PKG_BUILDDEP:=		libgcrypt popt e2fsprogs lvm
PKG_URL:=		http://cryptsetup.googlecode.com/
PKG_SITES:=		http://cryptsetup.googlecode.com/files/

PKG_SUBPKGS:=		CRYPTSETUP CRYPTSETUP_DEV
PKGSC_CRYPTSETUP_DEV:=	devel

PKG_ARCH_DEPENDS:=	!cris

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,CRYPTSETUP,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,CRYPTSETUP_DEV,cryptsetup-dev,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKGSC_CRYPTSETUP_DEV}))

TARGET_CFLAGS:=         $(filter-out -flto,$(TARGET_CFLAGS))
CONFIGURE_ARGS+=	--disable-selinux

post-install:
	${INSTALL_DIR} ${IDIR_CRYPTSETUP}/usr/sbin ${IDIR_CRYPTSETUP}/usr/lib
	${CP} ${WRKINST}/usr/lib/libcryptsetup.so* \
		${IDIR_CRYPTSETUP}/usr/lib
	${INSTALL_BIN} ${WRKINST}/usr/sbin/cryptsetup \
		${IDIR_CRYPTSETUP}/usr/sbin

cryptsetup-dev-install:
	${INSTALL_DIR} ${IDIR_CRYPTSETUP_DEV}/usr/include
	${CP} ${WRKINST}/usr/include/* \
		${IDIR_CRYPTSETUP_DEV}/usr/include

include ${TOPDIR}/mk/pkg-bottom.mk
