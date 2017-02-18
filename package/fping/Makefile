# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		fping
PKG_VERSION:=		3.16
PKG_RELEASE:=		1
PKG_HASH:=		2f753094e4df3cdb1d99be1687c0fb7d2f14c0d526ebf03158c8c5519bc78f54
PKG_DESCR:=		program to ping hosts in parallel
PKG_SECTION:=		net/debug
PKG_URL:=		http://fping.org
PKG_SITES:=		http://fping.org/dist/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,FPING,fping,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

fping-install:
	${INSTALL_DIR} ${IDIR_FPING}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/fping ${IDIR_FPING}/usr/sbin/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
