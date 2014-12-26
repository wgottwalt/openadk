# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=		gcc
ifeq ($(ADK_TOOLCHAIN_GCC_4_9_2),y)
PKG_VERSION:=		4.9.2
PKG_MD5SUM:=		76f464e0511c26c93425a9dcdc9134cf
PKG_SITES:=		${MASTER_SITE_GNU:=gcc/gcc-${PKG_VERSION}/}
PKG_RELEASE:=		1
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz
LIBSTDCXXVER:=		19
endif
ifeq ($(ADK_TOOLCHAIN_GCC_4_8_4),y)
PKG_VERSION:=		4.8.4
PKG_MD5SUM:=		0c92ac45af5b280e301ca56b40fdaea2
PKG_SITES:=		${MASTER_SITE_GNU:=gcc/gcc-${PKG_VERSION}/}
PKG_RELEASE:=		1
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz
LIBSTDCXXVER:=		19
endif
ifeq ($(ADK_TOOLCHAIN_GCC_4_8_0_ARC),y)
# git commit e9dbcfdba0f42639b3aa9e3b06fe781599eb98fe
# from https://github.com/foss-for-synopsys-dwc-arc-processors/gcc/tree/arc-4.8-tls
PKG_VERSION:=		4.8.0
PKG_MD5SUM:=		91db62ad4f9bb9217f135b20a098ee03
PKG_SITES:=		http://www.openadk.org/distfiles/
PKG_RELEASE:=		1
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}-arc.tar.xz
endif
ifeq ($(ADK_TOOLCHAIN_GCC_4_7_4),y)
PKG_VERSION:=		4.7.4
PKG_MD5SUM:=		e2c60f5ef918be2db08df96c7d97d0c4
PKG_SITES:=		${MASTER_SITE_GNU:=gcc/gcc-${PKG_VERSION}/}
PKG_RELEASE:=		1
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz
LIBSTDCXXVER:=		17
endif
ifeq ($(ADK_TOOLCHAIN_GCC_4_5_4),y)
PKG_VERSION:=		4.5.4
PKG_MD5SUM:=		e2c60f5ef918be2db08df96c7d97d0c4
PKG_SITES:=		${MASTER_SITE_GNU:=gcc/gcc-${PKG_VERSION}/}
PKG_RELEASE:=		1
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz
LIBSTDCXXVER:=		19
endif
ifeq ($(ADK_TOOLCHAIN_GCC_4_4_7),y)
PKG_VERSION:=		4.4.7
PKG_MD5SUM:=		e2c60f5ef918be2db08df96c7d97d0c4
PKG_SITES:=		${MASTER_SITE_GNU:=gcc/gcc-${PKG_VERSION}/}
PKG_RELEASE:=		1
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz
LIBSTDCXXVER:=		19
endif
