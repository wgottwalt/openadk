# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		heirloom-cpio
PKG_VERSION:=		1.0
PKG_RELEASE:=		1
PKG_DESCR:=		patched version of heirloom cpio
PKG_SECTION:=		archive

PKG_CFLINE_HEIRLOOM_CPIO:=	depends on ADK_HOST_ONLY

NO_DISTFILES:=		1

include ${TOPDIR}/mk/host.mk
include ${TOPDIR}/mk/package.mk

$(eval $(call HOST_template,HEIRLOOM_CPIO,heirloom-cpio,${PKG_VERSION}-${PKG_RELEASE}))

HOST_STYLE:=		manual

host-build:
	(cd ${WRKBUILD} && env ${HOST_MAKE_ENV} ${MAKE} -f ${MAKE_FILE} \
		${HOST_MAKE_FLAGS} ${HOST_ALL_TARGET})

heirloom-cpio-hostinstall:
	${INSTALL_DIR} ${STAGING_HOST_DIR}/usr/bin
	${INSTALL_BIN} ${WRKBUILD}/cpio ${STAGING_HOST_DIR}/usr/bin

include ${TOPDIR}/mk/host-bottom.mk
include ${TOPDIR}/mk/pkg-bottom.mk
