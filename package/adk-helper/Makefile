# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		adk-helper
PKG_VERSION:=		1.0
PKG_RELEASE:=		2
PKG_DESCR:=		adk helper utilities
PKG_SECTION:=		base/adk

PKG_CFLINE_ADK_HELPER:=	depends on ADK_HOST_ONLY

NO_DISTFILES:=		1

include ${ADK_TOPDIR}/mk/host.mk
include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call HOST_template,ADK_HELPER,adk-helper,${PKG_VERSION}-${PKG_RELEASE}))

HOST_STYLE:=		manual

host-build:
	$(HOST_CC) $(HOST_CFLAGS) -o ${WRKBUILD}/mkcrypt ${WRKBUILD}/mkcrypt.c
	$(HOST_CC) $(HOST_CFLAGS) -o ${WRKBUILD}/dkgetsz ${WRKBUILD}/dkgetsz.c
	$(HOST_CC) $(HOST_CFLAGS) -o ${WRKBUILD}/makedevs ${WRKBUILD}/makedevs.c

adk-helper-hostinstall:
	${INSTALL_DIR} ${STAGING_HOST_DIR}/usr/bin
	${INSTALL_BIN} ${WRKBUILD}/mkcrypt ${STAGING_HOST_DIR}/usr/bin
	${INSTALL_BIN} ${WRKBUILD}/dkgetsz ${STAGING_HOST_DIR}/usr/bin
	${INSTALL_BIN} ${WRKBUILD}/makedevs ${STAGING_HOST_DIR}/usr/bin

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
