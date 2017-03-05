# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=		binutils
ifeq ($(ADK_TOOLCHAIN_BINUTILS_2_28),y)
PKG_VERSION:=		2.28
PKG_RELEASE:=		1
PKG_HASH:=		cd717966fc761d840d451dbd58d44e1e5b92949d2073d75b73fccb476d772fcf
PKG_SITES:=		${MASTER_SITE_GNU:=binutils/}
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz
endif
ifeq ($(ADK_TOOLCHAIN_BINUTILS_2_27),y)
PKG_VERSION:=		2.27
PKG_RELEASE:=		1
PKG_HASH:=		26253bf0f360ceeba1d9ab6965c57c6a48a01a8343382130d1ed47c468a3094f
PKG_SITES:=		${MASTER_SITE_GNU:=binutils/}
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz
endif
ifeq ($(ADK_TOOLCHAIN_BINUTILS_2_26_1),y)
PKG_VERSION:=		2.26.1
PKG_RELEASE:=		1
PKG_HASH:=		dd9c3e37c266e4fefba68e444e2a00538b3c902dd31bf4912d90dca6d830a2a1
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
ifeq ($(ADK_TOOLCHAIN_BINUTILS_ARC),y)
PKG_VERSION:=		arc-2016.09-release
PKG_GIT:=		tag
PKG_RELEASE:=		1
PKG_SITES:=		https://github.com/foss-for-synopsys-dwc-arc-processors/binutils-gdb.git
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.xz
endif
ifeq ($(ADK_TOOLCHAIN_BINUTILS_NDS32),y)
PKG_VERSION:=		2.24-nds32
PKG_RELEASE:=		1
PKG_HASH:=		ab1c72aeed2d50403bdf67914e60d936279d065943d83d1c19c20462a7b82cda
PKG_SITES:=		http://distfiles.openadk.org/
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.xz
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
