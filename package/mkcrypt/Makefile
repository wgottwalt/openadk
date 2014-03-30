# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		mkcrypt
PKG_VERSION:=		1.0
PKG_RELEASE:=		1
PKG_DESCR:=		mkcrypt utility
PKG_SECTION:=		misc

PKG_CFLINE_MKCRYPT:=	depends on ADK_HOST_ONLY

NO_DISTFILES:=		1

include ${TOPDIR}/mk/host.mk
include ${TOPDIR}/mk/package.mk

$(eval $(call HOST_template,MKCRYPT,mkcrypt,${PKG_VERSION}-${PKG_RELEASE}))

HOST_STYLE:=		manual

host-build:
	$(CC_FOR_BUILD) $(CFLAGS_FOR_BUILD) -o ${WRKBUILD}/mkcrypt ${WRKBUILD}/mkcrypt.c

mkcrypt-hostinstall:
	${INSTALL_DIR} ${STAGING_HOST_DIR}/usr/bin
	${INSTALL_BIN} ${WRKBUILD}/mkcrypt ${STAGING_HOST_DIR}/usr/bin

include ${TOPDIR}/mk/host-bottom.mk
include ${TOPDIR}/mk/pkg-bottom.mk
