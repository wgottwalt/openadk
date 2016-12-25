# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		cpio
PKG_VERSION:=		2.11
PKG_RELEASE:=		1
PKG_HASH:=		601b1d774cd6e4cd39416203c91ec59dbd65dd27d79d75e1a9b89497ea643978
PKG_DESCR:=		archive utility
PKG_SECTION:=		app/archive
PKG_URL:=		http://www.gnu.org/software/cpio/
PKG_SITES:=		${MASTER_SITE_GNU:=cpio/}
PKG_BB:=		1

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/host.mk
include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call HOST_template,CPIO,cpio,${PKG_VERSION}-${PKG_RELEASE}))
$(eval $(call PKG_template,CPIO,cpio,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

cpio-install:
	${INSTALL_DIR} ${IDIR_CPIO}/usr/bin
	${CP} ${WRKINST}/usr/bin/cpio ${IDIR_CPIO}/usr/bin

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
