# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=		gdb
ifeq ($(ADK_TOOLCHAIN_GDB_7_11),y)
PKG_VERSION:=		7.11
PKG_RELEASE:=		1
PKG_HASH:=		7a434116cb630d77bb40776e8f5d3937bed11dea56bafebb4d2bc5dd389fe5c1
PKG_SITES:=		${MASTER_SITE_GNU:=gdb/}
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.xz
endif
ifeq ($(ADK_TOOLCHAIN_GDB_7_10_1),y)
PKG_VERSION:=		7.10.1
PKG_RELEASE:=		1
PKG_HASH:=		25c72f3d41c7c8554d61cacbeacd5f40993276d2ccdec43279ac546e3993d6d5
PKG_SITES:=		${MASTER_SITE_GNU:=gdb/}
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.xz
endif
ifeq ($(ADK_TOOLCHAIN_GDB_7_9_1),y)
PKG_VERSION:=		7.9.1
PKG_RELEASE:=		1
PKG_HASH:=		cd9c543a411a05b2b647dd38936034b68c2b5d6f10e0d51dc168c166c973ba40
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
PKG_VERSION:=		bf777b3966985cdb27184df90d175cb5a7a8fedc
PKG_RELEASE:=		1
PKG_SITES:=		git://git.pf.osdn.jp/gitroot/y/ys/ysato/binutils_gdb.git
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.xz
endif
ifeq ($(ADK_TOOLCHAIN_GDB_GIT),y)
PKG_VERSION:=		git
PKG_RELEASE:=		1
PKG_SITES:=		git://sourceware.org/git/binutils-gdb.git
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.xz
endif
