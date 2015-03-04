# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk
include $(ADK_TOPDIR)/toolchain/glibc/Makefile.inc

PKG_NAME:=		ldd
PKG_DESCR:=		Shared library dependency display tool
PKG_SECTION:=		dev/tools
PKG_DEPENDS:=		glibc bash
PKG_BUILDDEP:=		glibc
NO_DISTFILES:=		1

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LDD,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

do-install:
	$(INSTALL_DIR) $(IDIR_LDD)/usr/bin
	${INSTALL_BIN} ${STAGING_TARGET_DIR}/usr/bin/ldd ${IDIR_LDD}/usr/bin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
