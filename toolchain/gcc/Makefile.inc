# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=		gcc
ifeq ($(ADK_TOOLCHAIN_GCC_4_9_1),y)
PKG_VERSION:=		4.9.1
PKG_MD5SUM:=		b188a3c9be25ddbf36b4fa6f04aaafaa
PKG_SITES:=		${MASTER_SITE_GNU:=gcc/gcc-${PKG_VERSION}/}
PKG_RELEASE:=		1
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz
LIBSTDCXXVER:=		19
endif
ifeq ($(ADK_TOOLCHAIN_GCC_4_8_3),y)
PKG_VERSION:=		4.8.3
PKG_MD5SUM:=		e2c60f5ef918be2db08df96c7d97d0c4
PKG_SITES:=		${MASTER_SITE_GNU:=gcc/gcc-${PKG_VERSION}/}
PKG_RELEASE:=		1
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz
LIBSTDCXXVER:=		19
endif
ifeq ($(ADK_TOOLCHAIN_GCC_4_8_3_ARC),y)
PKG_VERSION:=		4.8.3
PKG_MD5SUM:=		e2c60f5ef918be2db08df96c7d97d0c4
PKG_SITES:=		http://www.openadk.org/distfiles/
PKG_RELEASE:=		1
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}-arc.tar.xz
endif
ifeq ($(ADK_TOOLCHAIN_GCC_4_5_4),y)
PKG_VERSION:=		4.5.4
PKG_MD5SUM:=		e2c60f5ef918be2db08df96c7d97d0c4
PKG_SITES:=		${MASTER_SITE_GNU:=gcc/gcc-${PKG_VERSION}/}
PKG_RELEASE:=		1
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz
LIBSTDCXXVER:=		19
endif
