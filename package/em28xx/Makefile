# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		em28xx
PKG_VERSION:=		20081206
PKG_RELEASE:=		1
PKG_MD5SUM:=		8467a1b1d495fa712c8beb617ef5f5dd
PKG_SITES:=		http://www.openadk.org/distfiles/

WRKDIST=		${WRKDIR}/${PKG_NAME}

include ${TOPDIR}/mk/package.mk


$(eval $(call PKG_template,KMOD_EM28XX,kmod-em28xx,${KERNEL_VERSION}+${PKG_VERSION}-${TARGET}-${PKG_RELEASE},kernel (${KERNEL_VERSION}-${TARGET}-${KERNEL_RELEASE})))

CONFIGURE_STYLE:=	manual
BUILD_STYLE:=		manual

EM28XX_MAKEOPTS=	-C ${WRKBUILD} \
			ARCH="${ARCH}" \
			CROSS_COMPILE="${TARGET_CROSS}" \
			TOOLPREFIX="${TARGET_CROSS}" \
			TOOLPATH="${TARGET_CROSS}" \
			KERNELPATH="${LINUX_DIR}" \
			V=1


do-build:
	${MAKE} ${EM28XX_MAKEOPTS} all

post-install:
	${INSTALL_DIR} ${IDIR_KMOD_EM28XX}/etc/modules.d/
	${INSTALL_DIR} ${IDIR_KMOD_EM28XX}/lib/modules/${KERNEL_VERSION}/
	${CP} ${WRKBUILD}/*.ko \
		${IDIR_KMOD_EM28XX}/lib/modules/${KERNEL_VERSION}/

include ${TOPDIR}/mk/pkg-bottom.mk
