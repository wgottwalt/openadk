# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		llvm
PKG_VERSION:=		3.4
PKG_RELEASE:=		1
PKG_HASH:=		25a5612d692c48481b9b397e2b55f4870e447966d66c96d655241702d44a2628
PKG_DESCR:=		collection of modular and reusable compiler and toolchain technologies
PKG_SECTION:=		dev/lang
PKG_URL:=		http://llvm.org/
PKG_SITES:=		http://llvm.org/releases/3.4/

PKG_LIBC_DEPENDS:=	glibc musl
PKG_HOST_DEPENDS:=	!darwin
PKG_ARCH_DEPENDS:=	mips x86 x86_64 arm

PKG_CFLINE_LLVM:=	depends on ADK_BROKEN
DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.src.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

TARGET_CFLAGS:=         $(filter-out -fhonour-copts,$(TARGET_CFLAGS))
# disable honour cflags stuff
XAKE_FLAGS+=            GCC_HONOUR_COPTS=s

$(eval $(call PKG_template,LLVM,llvm,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual
XAKE_FLAGS+=		VERBOSE=1

do-configure:
	mkdir -p $(WRKBUILD)/BuildTools
	(cd $(WRKBUILD)/BuildTools; env ac_cv_build_exeext="" ../configure ${CONFIGURE_TRIPLE} --prefix=/usr --disable-docs)

do-build:
	env GCC_HONOUR_COPTS=s ${MAKE} -C ${WRKBUILD}/BuildTools

do-install:
	env GCC_HONOUR_COPTS=s ${MAKE} -C ${WRKBUILD}/BuildTools DESTDIR=$(STAGING_TARGET_DIR) install 
	env GCC_HONOUR_COPTS=s ${MAKE} -C ${WRKBUILD}/BuildTools DESTDIR=$(WRKINST) install 
	cp ${WRKBUILD}/BuildTools/BuildTools/Release+Asserts/bin/llvm-config \
		$(STAGING_TARGET_DIR)/usr/bin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
