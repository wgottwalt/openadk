# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		cryptodev-linux
PKG_VERSION:=		1.4
PKG_RELEASE:=		1
PKG_MD5SUM:=		7b0ac1c0a88d8fbe7316db02f21666e6
PKG_DESCR:=		cryptodev-linux kernel module
PKG_SECTION:=		crypto
PKG_DEPENDS:=		kmod-crypto-manager2
PKG_URL:=		http://home.gna.org/cryptodev-linux/
PKG_SITES:=		http://download.gna.org/cryptodev-linux/

include $(TOPDIR)/mk/package.mk
include ${TOPDIR}/mk/kernel-vars.mk

$(eval $(call PKG_template,CRYPTODEV_LINUX,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

do-build:
	${MAKE} -C "${WRKBUILD}" version.h
	GCC_HONOUR_COPTS=0 LDFLAGS="" ${MAKE} ${KERNEL_MAKE_OPTS} \
			 M="${WRKBUILD}" modules
	${INSTALL_DIR} ${WRKINST}/usr/include/crypto
	${INSTALL_DATA} ${WRKBUILD}/crypto/cryptodev.h \
		${WRKINST}/usr/include/crypto/

do-install:
	${INSTALL_DIR} ${IDIR_CRYPTODEV_LINUX}/usr/include/crypto
	${INSTALL_DATA} ${WRKBUILD}/crypto/cryptodev.h \
		${IDIR_CRYPTODEV_LINUX}/usr/include/crypto/
	${INSTALL_DIR} ${IDIR_CRYPTODEV_LINUX}/etc/modules.d/
	echo "cryptodev" > ${IDIR_CRYPTODEV_LINUX}/etc/modules.d/90-cryptodev
	${INSTALL_DIR} ${IDIR_CRYPTODEV_LINUX}/lib/modules/${KERNEL_VERSION}/
	$(INSTALL_DATA)	$(WRKBUILD)/cryptodev.ko \
		$(IDIR_CRYPTODEV_LINUX)/lib/modules/${KERNEL_VERSION}/

include ${TOPDIR}/mk/pkg-bottom.mk
