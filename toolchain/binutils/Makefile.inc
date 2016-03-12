# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=		binutils
ifeq ($(ADK_TOOLCHAIN_BINUTILS_2_26),y)
PKG_VERSION:=		2.26
PKG_RELEASE:=		1
PKG_HASH:=		9615feddaeedc214d1a1ecd77b6697449c952eab69d79ab2125ea050e944bcc1
PKG_SITES:=		${MASTER_SITE_GNU:=binutils/}
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz
endif
ifeq ($(ADK_TOOLCHAIN_BINUTILS_2_25_1),y)
PKG_VERSION:=		2.25.1
PKG_RELEASE:=		1
PKG_HASH:=		82a40a37b13a12facb36ac7e87846475a1d80f2e63467b1b8d63ec8b6a2b63fc
PKG_SITES:=		${MASTER_SITE_GNU:=binutils/}
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz
endif
ifeq ($(ADK_TOOLCHAIN_BINUTILS_2_24),y)
PKG_VERSION:=		2.24
PKG_RELEASE:=		1
PKG_HASH:=		4930b2886309112c00a279483eaef2f0f8e1b1b62010e0239c16b22af7c346d4
PKG_SITES:=		${MASTER_SITE_GNU:=binutils/}
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz
endif
ifeq ($(ADK_TOOLCHAIN_BINUTILS_2_23_ARC),y)
PKG_VERSION:=		fc013006f64af9933a0b3171d5e48d8dfd53e44b
PKG_RELEASE:=		1
PKG_SITES:=		https://github.com/foss-for-synopsys-dwc-arc-processors/binutils-gdb_refact.git
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.xz
endif
ifeq ($(ADK_TOOLCHAIN_BINUTILS_2_22),y)
PKG_VERSION:=		2.22
PKG_RELEASE:=		1
PKG_HASH:=		12c26349fc7bb738f84b9826c61e103203187ca2d46f08b82e61e21fcbc6e3e6
PKG_SITES:=		${MASTER_SITE_GNU:=binutils/}
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz
endif
ifeq ($(ADK_TOOLCHAIN_BINUTILS_2_20_1),y)
PKG_VERSION:=		2.20.1
PKG_RELEASE:=		1
PKG_HASH:=		71d37c96451333c5c0b84b170169fdcb138bbb27397dc06281905d9717c8ed64
PKG_SITES:=		${MASTER_SITE_GNU:=binutils/}
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2
endif
ifeq ($(ADK_TOOLCHAIN_BINUTILS_GIT),y)
PKG_VERSION:=		git
PKG_RELEASE:=		1
PKG_SITES:=		git://sourceware.org/git/binutils-gdb.git
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.xz
endif
