# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		adkinstall
PKG_VERSION:=		1.0
PKG_RELEASE:=		3
PKG_DESCR:=		installer for compact flash or nand/mtd devices
PKG_SECTION:=		base
PKG_DEPENDS:=		parted sfdisk

PKG_TARGET_DEPENDS:=	alix wrap rb532

WRKDIST=		${WRKDIR}/${PKG_NAME}-${PKG_VERSION}
NO_DISTFILES:=		1

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,ADKINSTALL,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

pre-configure:
	mkdir -p ${WRKBUILD}

do-install:
	${INSTALL_DIR} $(IDIR_ADKINSTALL)/sbin
ifeq ($(ADK_LINUX_MIPS_RB532),y)
	${INSTALL_BIN} ./src/adkinstall.rb532 \
		$(IDIR_ADKINSTALL)/sbin/adkinstall
else
	${INSTALL_BIN} ./src/adkinstall $(IDIR_ADKINSTALL)/sbin
endif

include ${TOPDIR}/mk/pkg-bottom.mk
