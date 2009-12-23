# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		cfinstall
PKG_VERSION:=		1.0
PKG_RELEASE:=		1
PKG_DESCR:=		compact flash installer
PKG_SECTION:=		base
PKG_DEPENDS:=		parted sfdisk

PKG_TARGET_DEPENDS:=	alix1c alix2d wrap rb532

WRKDIST=		${WRKDIR}/${PKG_NAME}-${PKG_VERSION}
NO_DISTFILES:=		1

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,CFINSTALL,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

pre-configure:
	mkdir -p ${WRKBUILD}

do-install:
	${INSTALL_DIR} $(IDIR_CFINSTALL)/sbin
	${INSTALL_BIN} ./src/cfinstall $(IDIR_CFINSTALL)/sbin

include ${TOPDIR}/mk/pkg-bottom.mk
