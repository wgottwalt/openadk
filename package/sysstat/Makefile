# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		sysstat
PKG_VERSION:=		11.4.4
PKG_RELEASE:=		1
PKG_HASH:=		6585f08e24347d2d6462aee6ef97e80fe4cc869605193184500df0f80fa61cc8
PKG_DESCR:=		system monitoring and performance analysis
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
