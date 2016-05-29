# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		sysstat
PKG_VERSION:=		11.2.4
PKG_RELEASE:=		1
PKG_HASH:=		2fb41049ef72c58c29e5966b27f31d8a30f8f468ef994c4ad0f20900fa0473b7
PKG_DESCR:=		utilities for system monitoring and performance analysis
PKG_SECTION:=		sys/utils
PKG_SITES:=		http://pagesperso-orange.fr/sebastien.godard/

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,SYSSTAT,sysstat,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

sysstat-install:
	${INSTALL_DIR} ${IDIR_SYSSTAT}/usr/lib/sa
	${INSTALL_DIR} ${IDIR_SYSSTAT}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/lib/sa/{sa1,sa2,sadc} \
		${IDIR_SYSSTAT}/usr/lib/sa
	${INSTALL_BIN} ${WRKINST}/usr/bin/{sar,sadf,iostat,mpstat} \
		${IDIR_SYSSTAT}/usr/bin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
