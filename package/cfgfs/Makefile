# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		cfgfs
PKG_VERSION:=		1.0.7
PKG_RELEASE:=		3
PKG_DESCR:=		compressed config filesystem
PKG_SECTION:=		base

PKG_TARGET_DEPENDS:=	alix wrap foxboard ag241 foxg20 routerboard

WRKDIST=		${WRKDIR}/${PKG_NAME}-${PKG_VERSION}
NO_DISTFILES:=		1

CFLINE_CFGFS:= 		select BUSYBOX_COMM\n\tselect BUSYBOX_MD5SUM\n\tselect BUSYBOX_XARGS\n\tselect BUSYBOX_FEATURE_SORT_BIG\n\tselect BUSYBOX_DIFF\n\tdepends on !ADK_TARGET_ROOTFS_NFSROOT && !ADK_TARGET_ROOTFS_INITRAMFS_PIGGYBACK && !ADK_TARGET_ROOTFS_INITRAMFS

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,CFGFS,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

PKGDFLT_CFGFS=		y

CONFIG_STYLE:=		manual
INSTALL_STYLE:=		manual

do-install:
	${INSTALL_DIR} ${IDIR_CFGFS}/sbin
	${INSTALL_BIN} ${WRKBUILD}/fwcf.sh ${IDIR_CFGFS}/sbin/cfgfs
	${INSTALL_BIN} ${WRKBUILD}/fwcf.helper.out \
		${IDIR_CFGFS}/sbin/cfgfs.helper
	cd ${IDIR_CFGFS}/sbin; for tgt in halt reboot poweroff; do \
		ln cfgfs $$tgt; \
	done

include ${TOPDIR}/mk/pkg-bottom.mk
