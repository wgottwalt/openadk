# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		hdparm
PKG_VERSION:=		9.15
PKG_RELEASE:=		1
PKG_MD5SUM:=		0524dd10ad986285ff4eeb3507f7471c
PKG_DESCR:=		get/set ATA drive parameters
PKG_SECTION:=		misc
PKG_URL:=		http://sourceforge.net/projects/hdparm
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=hdparm/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,HDPARM,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual

post-install:
	${INSTALL_DIR} ${IDIR_HDPARM}/usr/sbin
	${INSTALL_BIN} ${WRKBUILD}/hdparm ${IDIR_HDPARM}/usr/sbin

include ${TOPDIR}/mk/pkg-bottom.mk
