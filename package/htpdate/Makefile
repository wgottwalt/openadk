# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		htpdate
PKG_VERSION:=		1.0.5
PKG_RELEASE:=		1
PKG_HASH:=		f465059495eae91437eb5eec7af92f1374eb3836f50926e8e5718818abf91e9a
PKG_DESCR:=		hypertext time protocol implementation
PKG_SECTION:=		net/ntp
PKG_URL:=		http://www.vervest.org/htp/
PKG_SITES:=		http://www.vervest.org/htp/archive/c/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,HTPDATE,htpdate,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual

htpdate-install:
	${INSTALL_DIR} ${IDIR_HTPDATE}/usr/sbin
	${INSTALL_BIN} ${WRKBUILD}/htpdate ${IDIR_HTPDATE}/usr/sbin/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
