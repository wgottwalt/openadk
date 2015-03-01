# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		cryptodev-linux
PKG_VERSION:=		1.7
PKG_RELEASE:=		1
PKG_HASH:=		41880533b53de4d7b3f054e230f576988dafb8eed7bef5ebcf6422bb2e3a3b25
PKG_DESCR:=		device that allows access to kernel cryptographic drivers
PKG_SECTION:=		app/crypto
PKG_BUILDDEP:=		openssl
PKG_URL:=		http://home.gna.org/cryptodev-linux/
PKG_SITES:=		http://download.gna.org/cryptodev-linux/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk
include ${ADK_TOPDIR}/mk/kernel-ver.mk
include ${ADK_TOPDIR}/mk/kernel-vars.mk

$(eval $(call PKG_template,CRYPTODEV_LINUX,cryptodev-linux,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
XAKE_FLAGS+=		CRYPTODEV_CFLAGS='-DENABLE_ASYNC -fhonour-copts' \
			ARCH='${ADK_TARGET_KARCH}' \
			KERNEL_DIR='${LINUX_DIR}' \
			CROSS_COMPILE='${TARGET_CROSS}'
ALL_TARGET:=		build
INSTALL_STYLE:=		manual

post-build:
	-${MAKE} -C "${WRKBUILD}"/tests check

do-install:
	${INSTALL_DIR} ${IDIR_CRYPTODEV_LINUX}/usr/bin
	for i in cipher cipher-aead hmac speed async_cipher async_hmac \
		async_speed sha_speed hashcrypt_speed fullspeed cipher-gcm \
		cipher-aead-srtp cipher_comp hash_comp hmac_comp; do \
		$(INSTALL_BIN) ${WRKBUILD}/tests/$$i ${IDIR_CRYPTODEV_LINUX}/usr/bin; \
	done
	${INSTALL_DIR} ${IDIR_CRYPTODEV_LINUX}/usr/include/crypto
	${INSTALL_DATA} ${WRKBUILD}/crypto/cryptodev.h \
		${IDIR_CRYPTODEV_LINUX}/usr/include/crypto/
	${INSTALL_DIR} ${IDIR_CRYPTODEV_LINUX}/etc/modules.d/
	echo "cryptodev" > ${IDIR_CRYPTODEV_LINUX}/etc/modules.d/90-cryptodev
	${INSTALL_DIR} ${IDIR_CRYPTODEV_LINUX}/lib/modules/${KERNEL_VERSION}/
	$(INSTALL_DATA)	$(WRKBUILD)/cryptodev.ko \
		$(IDIR_CRYPTODEV_LINUX)/lib/modules/${KERNEL_VERSION}/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
