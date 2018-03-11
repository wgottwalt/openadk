# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=		gcc
ifeq ($(ADK_TOOLCHAIN_GCC_7),y)
PKG_VERSION:=		7.3.0
PKG_HASH:=		832ca6ae04636adbb430e865a1451adf6979ab44ca1c8374f61fba65645ce15c
PKG_SITES:=		${MASTER_SITE_GNU:=gcc/gcc-${PKG_VERSION}/}
PKG_RELEASE:=		1
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.xz
LIBSTDCXXVER:=		23
endif
ifeq ($(ADK_TOOLCHAIN_GCC_6),y)
PKG_VERSION:=		6.3.0
PKG_HASH:=		02f9302a559fa2251595ca0bc1e937219eff2995a3802d7b31676fec2402beb4
PKG_SITES:=		${MASTER_SITE_GNU:=gcc/gcc-${PKG_VERSION}/}
PKG_RELEASE:=		1
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz
LIBSTDCXXVER:=		22
endif
ifeq ($(ADK_TOOLCHAIN_GCC_ARC),y)
PKG_VERSION:=		arc-2018.03-eng007
PKG_GIT:=		tag
PKG_SITES:=		https://github.com/foss-for-synopsys-dwc-arc-processors/gcc.git
PKG_RELEASE:=		1
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.xz
endif
ifeq ($(ADK_TOOLCHAIN_GCC_AVR32),y)
PKG_VERSION:=		4.4.7
PKG_HASH:=		76ad7c433af1c798a1e116c4dfa8f5f794f0d32bff65f88c54dcd5e5d146fc32
PKG_SITES:=		${MASTER_SITE_GNU:=gcc/gcc-${PKG_VERSION}/}
PKG_RELEASE:=		1
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz
LIBSTDCXXVER:=		19
endif
ifeq ($(ADK_TOOLCHAIN_GCC_CSKY),y)
PKG_VERSION:=		gcc-6-branch-csky
PKG_GIT:=		branch
PKG_SITES:=		https://github.com/c-sky/gcc.git
PKG_RELEASE:=		1
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.xz
endif
ifeq ($(ADK_TOOLCHAIN_GCC_METAG),y)
PKG_VERSION:=		4.2.4
PKG_HASH:=		7cb75c5183bd18f415860084440377016dc78feeee2852227b831f2e4fcaa5d6
PKG_SITES:=		http://gcc.cybermirror.org/releases/gcc-${PKG_VERSION}/
PKG_RELEASE:=		1
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz
LIBSTDCXXVER:=		19
endif
ifeq ($(ADK_TOOLCHAIN_GCC_NDS32),y)
PKG_VERSION:=		4.9.4-nds32
PKG_HASH:=		b23ce96df25dfdd5526496a3c2cd7ee1da4ed4094971a2e0c47c73ad7e1ad30a
PKG_SITES:=		http://distfiles.openadk.org/
PKG_RELEASE:=		1
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.xz
endif
ifeq ($(ADK_TOOLCHAIN_GCC_OR1K),y)
PKG_VERSION:=		musl-5.4.0
PKG_GIT:=		branch
PKG_SITES:=		https://github.com/openrisc/or1k-gcc.git
PKG_RELEASE:=		1
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.xz
LIBSTDCXXVER:=		21
endif
ifeq ($(ADK_TOOLCHAIN_GCC_GIT),y)
PKG_VERSION:=		git
PKG_SITES:=		https://github.com/gcc-mirror/gcc.git
PKG_RELEASE:=		1
LIBSTDCXXVER:=		23
endif
