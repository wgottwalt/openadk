# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		llvm
PKG_VERSION:=		2.9
PKG_RELEASE:=		1
PKG_MD5SUM:=		793138412d2af2c7c7f54615f8943771
PKG_DESCR:=		collection of modular and reusable compiler and toolchain technologies
PKG_SECTION:=		lang
PKG_URL:=		http://llvm.org/
PKG_SITES:=		http://llvm.org/releases/2.9/

PKG_CFLINE_LLVM:=	depends on ADK_TARGET_LIB_GLIBC || ADK_TARGET_LIB_EGLIBC
PKG_HOST_DEPENDS:=	!darwin

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tgz

include $(TOPDIR)/mk/package.mk

TARGET_CFLAGS:=         $(filter-out -fhonour-copts,$(TARGET_CFLAGS))
# disable honour cflags stuff
XAKE_FLAGS+=            GCC_HONOUR_COPTS=s

$(eval $(call PKG_template,LLVM,llvm,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

do-configure:
	mkdir -p $(WRKBUILD)/BuildTools
	(cd $(WRKBUILD)/BuildTools; env ac_cv_build_exeext="" ../configure ${CONFIGURE_TRIPLE} --prefix=/usr)

do-build:
	env GCC_HONOUR_COPTS=s ${MAKE} -C ${WRKBUILD}/BuildTools

do-install:
	env GCC_HONOUR_COPTS=s ${MAKE} -C ${WRKBUILD}/BuildTools DESTDIR=$(STAGING_TARGET_DIR) install 

llvm-install:
	$(INSTALL_DIR) $(IDIR_LLVM)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
