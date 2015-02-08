# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=		binutils
ifeq ($(ADK_TOOLCHAIN_BINUTILS_2_25),y)
PKG_VERSION:=		2.25
PKG_RELEASE:=		1
PKG_HASH:=		cccf377168b41a52a76f46df18feb8f7285654b3c1bd69fc8265cb0fc6902f2d
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
# git commit afcd0783a37c73e09439737a11e0b3183746a652
# https://github.com/foss-for-synopsys-dwc-arc-processors/binutils-gdb/tree/arc-2.23-tls
PKG_VERSION:=		2.23
PKG_RELEASE:=		1
PKG_HASH:=		12901398ada805926926e39eea84089efad6feabfe148a54a194db36a960f4f4
PKG_SITES:=		http://www.openadk.org/distfiles/
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}-arc.tar.xz
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
