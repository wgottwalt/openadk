# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		hdparm
PKG_VERSION:=		9.43
PKG_RELEASE:=		1
PKG_MD5SUM:=		f73233be118d86c779a8463d8b6a3cdb
PKG_DESCR:=		get/set ata/sata drive parameters
PKG_SECTION:=		sys/fs
PKG_URL:=		http://sourceforge.net/projects/hdparm
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=hdparm/}
PKG_BB:=		1

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,HDPARM,hdparm,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual

hdparm-install:
	${INSTALL_DIR} ${IDIR_HDPARM}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/sbin/hdparm ${IDIR_HDPARM}/usr/sbin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
