# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		mdadm
PKG_VERSION:=		3.0
PKG_RELEASE:=		2
PKG_MD5SUM:=		1eb89885b2b881562fc79ed2f5e1a056
PKG_DESCR:=		tool for managing Linux Software RAID arrays
PKG_SECTION:=		utils
PKG_URL:=		http://neil.brown.name/blog/mdadm
PKG_SITES:=		${MASTER_SITE_KERNEL:=utils/raid/mdadm/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,MDADM,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

XAKE_FLAGS+=		CROSS_COMPILE="${TARGET_CROSS}"
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_MDADM}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/sbin/mdadm ${IDIR_MDADM}/usr/sbin

include ${TOPDIR}/mk/pkg-bottom.mk
