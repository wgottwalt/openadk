# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=		gcc
ifeq ($(ADK_TOOLCHAIN_GCC_4_9_2),y)
PKG_VERSION:=		4.9.2
PKG_HASH:=		3e573826ec8b0d62d47821408fbc58721cd020df3e594cd492508de487a43b5e
PKG_SITES:=		${MASTER_SITE_GNU:=gcc/gcc-${PKG_VERSION}/}
PKG_RELEASE:=		1
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz
LIBSTDCXXVER:=		19
endif
ifeq ($(ADK_TOOLCHAIN_GCC_4_8_4),y)
PKG_VERSION:=		4.8.4
PKG_HASH:=		655fe692ddd333c29c5a1418f50f63a42cdd9e9eb7ebdb7f621e33c4b8799e31
PKG_SITES:=		${MASTER_SITE_GNU:=gcc/gcc-${PKG_VERSION}/}
PKG_RELEASE:=		1
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz
LIBSTDCXXVER:=		19
endif
ifeq ($(ADK_TOOLCHAIN_GCC_4_8_0_ARC),y)
# git commit e9dbcfdba0f42639b3aa9e3b06fe781599eb98fe
# from https://github.com/foss-for-synopsys-dwc-arc-processors/gcc/tree/arc-4.8-tls
PKG_VERSION:=		4.8.0
PKG_HASH:=		cbd50f7fa9d6dd4974ff809e1f5791de4a07796bd9fd6f71ed85d17a730a3783
PKG_SITES:=		http://www.openadk.org/distfiles/
PKG_RELEASE:=		1
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}-arc.tar.xz
endif
ifeq ($(ADK_TOOLCHAIN_GCC_4_7_4),y)
PKG_VERSION:=		4.7.4
PKG_HASH:=		ddbaa583c5d4e4f0928bf15d9f6b6c283349e16eedc47bde71e1b813f6f37819
PKG_SITES:=		${MASTER_SITE_GNU:=gcc/gcc-${PKG_VERSION}/}
PKG_RELEASE:=		1
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz
LIBSTDCXXVER:=		17
endif
ifeq ($(ADK_TOOLCHAIN_GCC_4_5_4),y)
PKG_VERSION:=		4.5.4
PKG_HASH:=		33fb968907ef7b6c528f6395ba049eb34c4df859bf5aa6c2bc3856268801e078
PKG_SITES:=		${MASTER_SITE_GNU:=gcc/gcc-${PKG_VERSION}/}
PKG_RELEASE:=		1
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz
LIBSTDCXXVER:=		19
endif
ifeq ($(ADK_TOOLCHAIN_GCC_4_4_7),y)
PKG_VERSION:=		4.4.7
PKG_HASH:=		76ad7c433af1c798a1e116c4dfa8f5f794f0d32bff65f88c54dcd5e5d146fc32
PKG_SITES:=		${MASTER_SITE_GNU:=gcc/gcc-${PKG_VERSION}/}
PKG_RELEASE:=		1
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz
LIBSTDCXXVER:=		19
endif
ifeq ($(ADK_TOOLCHAIN_GCC_GIT),y)
PKG_VERSION:=		git
PKG_SITES:=		git://gcc.gnu.org/git/gcc.git
PKG_RELEASE:=		1
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.xz
LIBSTDCXXVER:=		19
endif
