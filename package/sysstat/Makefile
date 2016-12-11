# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		sysstat
PKG_VERSION:=		11.4.2
PKG_RELEASE:=		1
PKG_HASH:=		1fd407f8971f5854bc853d931dd85bcbea08658130f3f8510a730d5561980f39
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
