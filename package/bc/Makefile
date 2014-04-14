# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		bc
PKG_VERSION:=		1.06
PKG_RELEASE:=		1
PKG_MD5SUM:=		d44b5dddebd8a7a7309aea6c36fda117
PKG_DESCR:=		arbitrary precision calculator language
PKG_SECTION:=		utils
PKG_BUILDDEP:=		m4-host flex-host
HOST_BUILDDEP:=		m4-host flex-host
PKG_URL:=		http://www.gnu.org/software/bc/
PKG_SITES:=		http://ftp.gnu.org/pub/gnu/bc/

PKG_SUBPKGS:=		BC DC

include ${TOPDIR}/mk/host.mk
include ${TOPDIR}/mk/package.mk

$(eval $(call HOST_template,BC,bc,${PKG_VERSION}-${PKG_RELEASE}))
$(eval $(call PKG_template,BC,bc,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,DC,dc,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

HOST_STYLE:=		auto

bc-install:
	${INSTALL_DIR} ${IDIR_BC}/usr/bin
	${INSTALL_BIN} ${WRKBUILD}/bc/bc ${IDIR_BC}/usr/bin/bc

dc-install:
	${INSTALL_DIR} ${IDIR_DC}/usr/bin
	${INSTALL_BIN} ${WRKBUILD}/dc/dc ${IDIR_DC}/usr/bin/dc

include ${TOPDIR}/mk/host-bottom.mk
include ${TOPDIR}/mk/pkg-bottom.mk
