# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		adkinstall
PKG_VERSION:=		1.0
PKG_RELEASE:=		8
PKG_DESCR:=		openadk installer
PKG_SECTION:=		base
PKG_DEPENDS:=		parted sfdisk e2fsprogs
PKG_URL:=		http://openadk.org/

WRKDIST=		${WRKDIR}/${PKG_NAME}-${PKG_VERSION}
NO_DISTFILES:=		1

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,ADKINSTALL,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

pre-configure:
	mkdir -p ${WRKBUILD}

do-install:
	${INSTALL_DIR} $(IDIR_ADKINSTALL)/sbin
ifeq ($(ADK_TARGET_SYSTEM_MIKROTIK_RB532),y)
	${INSTALL_BIN} ./src/adkinstall.rb532 \
		$(IDIR_ADKINSTALL)/sbin/adkinstall
else ifeq ($(ADK_TARGET_SYSTEM_ACMESYSTEMS_FOXG20),y)
	${INSTALL_BIN} ./src/adkinstall.foxg20 \
		$(IDIR_ADKINSTALL)/sbin/adkinstall
else ifeq ($(ADK_TARGET_SYSTEM_MIKROTIK_RB411),y)
	${INSTALL_BIN} ./src/adkinstall.rb4xx \
		$(IDIR_ADKINSTALL)/sbin/adkinstall
else ifeq ($(ADK_TARGET_SYSTEM_MIKROTIK_RB433),y)
	${INSTALL_BIN} ./src/adkinstall.rb4xx \
		$(IDIR_ADKINSTALL)/sbin/adkinstall
else
	${INSTALL_BIN} ./src/adkinstall $(IDIR_ADKINSTALL)/sbin
endif

include ${TOPDIR}/mk/pkg-bottom.mk
