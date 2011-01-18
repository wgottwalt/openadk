# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		rtsp
PKG_VERSION:=		1.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		92bb09883dd8a77ec5cfbff1c8932b15
PKG_DESCR:=		connection tracking for RTSP
PKG_SECTION:=		kernel
PKG_URL:=		http://github.com/maru-sama/rtsp-linux-v2.6

NO_DISTFILES:=          1

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,RTSP_KMOD,rtsp-kmod,${KERNEL_VERSION}-${ADK_TARGET}-${PKG_RELEASE},,${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

pre-build:
	ARCH=${ARCH} KERNELDIR=${LINUX_DIR} \
	PREFIX=/usr CROSS_COMPILE="${TARGET_CROSS}" \
	LD=$(TARGET_CROSS)gcc LDFLAGS="" CFLAGS="-Wall" \
	$(MAKE) -C ${WRKBUILD} debug V=1

do-install:
	${INSTALL_DIR} ${IDIR_RTSP_KMOD}/etc/modules.d/
	echo "nf_conntrack_rtsp" > ${IDIR_RTSP_KMOD}/etc/modules.d/60-nf-nat-rtsp
	echo "nf_nat_rtsp" >> ${IDIR_RTSP_KMOD}/etc/modules.d/60-nf-nat-rtsp
	${INSTALL_DIR} ${IDIR_RTSP_KMOD}/lib/modules/${KERNEL_VERSION}/
	${INSTALL_DATA} ${WRKBUILD}/*.ko \
		${IDIR_RTSP_KMOD}/lib/modules/${KERNEL_VERSION}

include ${TOPDIR}/mk/pkg-bottom.mk
