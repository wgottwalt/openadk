# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=		gdb
ifeq ($(ADK_TOOLCHAIN_GDB_7_8_2),y)
PKG_VERSION:=		7.8.2
PKG_RELEASE:=		1
PKG_HASH:=		605954d5747d5f08ea4b7f48e958d1ebbf39265e18f7f36738deeabb83744485
PKG_SITES:=		${MASTER_SITE_GNU:=gdb/}
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.xz
endif
ifeq ($(ADK_TOOLCHAIN_GDB_6_7_1),y)
PKG_VERSION:=		6.7.1
PKG_RELEASE:=		1
PKG_HASH:=		d763a458c88d4718aa19060d003de4e884f4ac87a9e88d2d35e776b53eeca2f4
PKG_SITES:=		http://distribute.atmel.no/tools/avr32/old/avr32gnutoolchain/v2.4.2/source/
DISTFILES:=		avr32-gdb-6.7.1.atmel.1.0.4.tar.gz
WRKDIST=		$(WRKDIR)/gdb-6.7.1.atmel.1.0.4
endif
