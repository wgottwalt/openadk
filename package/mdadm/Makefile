# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		mdadm
PKG_VERSION:=		3.1.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		8bfeea282d21b5ef8e825122fb359457
PKG_DESCR:=		tool for managing Linux Software RAID arrays
PKG_SECTION:=		fs
PKG_URL:=		http://neil.brown.name/blog/mdadm
PKG_SITES:=		${MASTER_SITE_KERNEL:=utils/raid/mdadm/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,MDADM,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual

XAKE_FLAGS+=		CROSS_COMPILE="${TARGET_CROSS}"

post-install:
	${INSTALL_DIR} ${IDIR_MDADM}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/sbin/mdadm ${IDIR_MDADM}/usr/sbin

include ${TOPDIR}/mk/pkg-bottom.mk
