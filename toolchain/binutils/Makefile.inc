# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=		binutils
ifeq ($(ADK_TOOLCHAIN_BINUTILS_2_35_1),y)
PKG_VERSION:=		2.35.1
PKG_RELEASE:=		1
PKG_HASH:=		3ced91db9bf01182b7e420eab68039f2083aed0a214c0424e257eae3ddee8607
PKG_SITES:=		${MASTER_SITE_GNU:=binutils/}
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.xz
endif
ifeq ($(ADK_TOOLCHAIN_BINUTILS_2_35),y)
PKG_VERSION:=		2.35
PKG_RELEASE:=		1
PKG_HASH:=		1b11659fb49e20e18db460d44485f09442c8c56d5df165de9461eb09c8302f85
PKG_SITES:=		${MASTER_SITE_GNU:=binutils/}
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.xz
endif
ifeq ($(ADK_TOOLCHAIN_BINUTILS_2_29),y)
PKG_VERSION:=		2.29.1
PKG_RELEASE:=		1
PKG_HASH:=		e7010a46969f9d3e53b650a518663f98a5dde3c3ae21b7d71e5e6803bc36b577
PKG_SITES:=		${MASTER_SITE_GNU:=binutils/}
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.xz
endif
ifeq ($(ADK_TOOLCHAIN_BINUTILS_2_28),y)
PKG_VERSION:=		2.28
PKG_RELEASE:=		1
PKG_HASH:=		cd717966fc761d840d451dbd58d44e1e5b92949d2073d75b73fccb476d772fcf
PKG_SITES:=		${MASTER_SITE_GNU:=binutils/}
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz
endif
ifeq ($(ADK_TOOLCHAIN_BINUTILS_NDS32),y)
PKG_VERSION:=		nds32-binutils-2.30-branch-open
PKG_GIT:=		branch
PKG_RELEASE:=		1
PKG_SITES:=		https://github.com/andestech/binutils.git
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.xz
endif
ifeq ($(ADK_TOOLCHAIN_BINUTILS_AVR32),y)
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
