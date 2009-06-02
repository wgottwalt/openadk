# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		bc
PKG_VERSION:=		1.06
PKG_RELEASE:=		1
PKG_MD5SUM:=		d44b5dddebd8a7a7309aea6c36fda117
PKG_DESCR:=		An arbitrary precision calculator language
PKG_SECTION:=		util
PKG_URL:=		http://www.gnu.org/software/bc
PKG_SITES:=		http://ftp.gnu.org/pub/gnu/bc/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,BC,bc,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,DC,dc,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE=	gnu
BUILD_STYLE=		auto
INSTALL_STYLE=		auto

post-install:
	# bc
	${INSTALL_DIR} ${IDIR_BC}/usr/bin
	${INSTALL_BIN} ${WRKBUILD}/bc/bc ${IDIR_BC}/usr/bin/bc
	# dc
	${INSTALL_DIR} ${IDIR_DC}/usr/bin
	${INSTALL_BIN} ${WRKBUILD}/dc/dc ${IDIR_DC}/usr/bin/dc

include ${TOPDIR}/mk/pkg-bottom.mk
