# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=		gdb
ifeq ($(ADK_TOOLCHAIN_GDB_8_2),y)
PKG_VERSION:=		8.2.1
PKG_RELEASE:=		1
PKG_HASH:=		0a6a432907a03c5c8eaad3c3cffd50c00a40c3a5e3c4039440624bae703f2202
PKG_SITES:=		${MASTER_SITE_GNU:=gdb/}
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.xz
endif
ifeq ($(ADK_TOOLCHAIN_GDB_6_7_1),y)
PKG_VERSION:=		6.7.1
PKG_RELEASE:=		1
PKG_HASH:=		a34c65163a2428e24891466b1f095249bc6301b64cfe9480f3aba341b58c3434
PKG_SITES:=		http://distfiles.openadk.org/
DISTFILES:=		gdb-6.7.1-avr32-2.1.5.tar.bz2
WRKDIST=		$(WRKDIR)/gdb-6.7.1-avr32-2.1.5
endif
ifeq ($(ADK_TOOLCHAIN_GDB_H8300_GIT),y)
PKG_VERSION:=		ysato-h8300
PKG_RELEASE:=		1
PKG_GIT:=		branch
PKG_SITES:=		git://git.pf.osdn.jp/gitroot/y/ys/ysato/binutils_gdb.git
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.xz
endif
ifeq ($(ADK_TOOLCHAIN_GDB_RISCV_GIT),y)
PKG_VERSION:=		riscv-gdb-8.1
PKG_RELEASE:=		1
PKG_GIT:=		branch
PKG_SITES:=		https://github.com/riscv/riscv-binutils-gdb.git
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.xz
endif
ifeq ($(ADK_TOOLCHAIN_GDB_GIT),y)
PKG_VERSION:=		git
PKG_RELEASE:=		1
PKG_SITES:=		git://sourceware.org/git/binutils-gdb.git
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.xz
endif
