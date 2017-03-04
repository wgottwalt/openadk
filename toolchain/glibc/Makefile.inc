# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=		glibc
ifeq ($(ADK_LIBC_VERSION),git)
PKG_VERSION:=		2.25.90
PKG_SITES:=		git://sourceware.org/git/glibc.git
PKG_RELEASE:=		1
endif
ifeq ($(ADK_TARGET_LIB_GLIBC_2_25),y)
PKG_VERSION:=		2.25
PKG_RELEASE:=		1
PKG_SITES:=		${MASTER_SITE_GNU:=glibc/}
PKG_HASH:=		067bd9bb3390e79aa45911537d13c3721f1d9d3769931a30c2681bfee66f23a0
endif
ifeq ($(ADK_TARGET_LIB_GLIBC_RISCV),y)
PKG_VERSION:=		riscv-next
PKG_RELEASE:=		1
PKG_GIT:=		branch
PKG_SITES:=		https://github.com/riscv/riscv-glibc.git
endif
DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).tar.xz
