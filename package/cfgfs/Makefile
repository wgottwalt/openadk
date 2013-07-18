# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		cfgfs
PKG_VERSION:=		1.0.9
PKG_RELEASE:=		5
PKG_DESCR:=		compressed config filesystem
PKG_SECTION:=		base
PKG_URL:=		http://openadk.org/

PKG_CFLINE_CFGFS:=	select BUSYBOX_COMM@
PKG_CFLINE_CFGFS+=	select BUSYBOX_MD5SUM@
PKG_CFLINE_CFGFS+=	select BUSYBOX_XARGS@
PKG_CFLINE_CFGFS+=	select BUSYBOX_FEATURE_SORT_BIG@
PKG_CFLINE_CFGFS+=	depends on !ADK_TARGET_ROOTFS_NFSROOT && !ADK_TARGET_ROOTFS_INITRAMFS_PIGGYBACK && !ADK_TARGET_ROOTFS_INITRAMFS
PKG_DFLT_CFGFS:=	y if !(ADK_TOOLCHAIN_ONLY || ADK_TOOLCHAIN_ARCHIVE)

WRKDIST=		${WRKDIR}/${PKG_NAME}-${PKG_VERSION}
NO_DISTFILES:=		1

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,CFGFS,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
INSTALL_STYLE:=		manual

TARGET_LDFLAGS+=	-static-libgcc

do-install:
	${INSTALL_DIR} ${IDIR_CFGFS}/sbin
	${INSTALL_BIN} ${WRKBUILD}/fwcf.sh ${IDIR_CFGFS}/sbin/cfgfs
	${INSTALL_BIN} ${WRKBUILD}/fwcf.helper.out \
		${IDIR_CFGFS}/sbin/cfgfs.helper
	cd ${IDIR_CFGFS}/sbin; for tgt in halt reboot poweroff; do \
		ln cfgfs $$tgt; \
	done

include ${TOPDIR}/mk/pkg-bottom.mk
