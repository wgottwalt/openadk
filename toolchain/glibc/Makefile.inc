# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=		glibc
ifeq ($(ADK_LIBC_VERSION),git)
PKG_VERSION:=		2.26.90
PKG_SITES:=		git://sourceware.org/git/glibc.git
PKG_RELEASE:=		1
endif
ifeq ($(ADK_TARGET_LIB_GLIBC_2_26),y)
PKG_VERSION:=		2.26
PKG_RELEASE:=		1
PKG_SITES:=		${MASTER_SITE_GNU:=glibc/}
PKG_HASH:=		e54e0a934cd2bc94429be79da5e9385898d2306b9eaf3c92d5a77af96190f6bd
endif
ifeq ($(ADK_TARGET_LIB_GLIBC_RISCV),y)
PKG_VERSION:=		riscv-next
PKG_RELEASE:=		1
PKG_GIT:=		branch
PKG_SITES:=		https://github.com/riscv/riscv-glibc.git
endif
DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).tar.xz
