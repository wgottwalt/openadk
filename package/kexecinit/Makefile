# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		kexecinit
PKG_VERSION:=		1.0
PKG_RELEASE:=		1
PKG_DESCR:=		init for kexec rootfilesystem
PKG_SECTION:=		base/adk

WRKDIST=		${WRKDIR}/${PKG_NAME}-${PKG_VERSION}
NO_DISTFILES:=		1

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,KEXECINIT,kexecinit,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

do-install:
	$(INSTALL_BIN) ./src/kexecinit $(IDIR_KEXECINIT)/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
