# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		sysstat
PKG_VERSION:=		11.2.0
PKG_RELEASE:=		1
PKG_HASH:=		9806b9a662568796d3fb93ecd01ecea10d815e668337a646494953bff4bc4155
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
