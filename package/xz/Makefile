# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		xz
PKG_VERSION:=		5.0.5
PKG_RELEASE:=		1
PKG_MD5SUM:=		19d924e066b6fff0bc9d1981b4e53196
PKG_DESCR:=		xz compression utility
PKG_SECTION:=		archive
PKG_URL:=		http://tukaani.org/xz/
PKG_SITES:=		http://tukaani.org/xz/
PKG_OPTS:=		dev

include ${TOPDIR}/mk/host.mk
include ${TOPDIR}/mk/package.mk

$(eval $(call HOST_template,XZ,xz,${PKG_VERSION}-${PKG_RELEASE}))
$(eval $(call PKG_template,XZ,xz,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

HOST_STYLE:=		auto

xz-install:
	${INSTALL_DIR} ${IDIR_XZ}/usr/bin ${IDIR_XZ}/usr/lib
	${CP} ${WRKINST}/usr/bin/* ${IDIR_XZ}/usr/bin
	${CP} ${WRKINST}/usr/lib/*.so* ${IDIR_XZ}/usr/lib

include ${TOPDIR}/mk/host-bottom.mk
include ${TOPDIR}/mk/pkg-bottom.mk
