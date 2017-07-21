# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=		gcc
ifeq ($(ADK_TOOLCHAIN_GCC_7),y)
PKG_VERSION:=		7.1.0
PKG_HASH:=		3c187ef42e4cf657eec0ed641aac7f7e46261bcb1cea31b72dcf2dedddbbdea5
PKG_SITES:=		${MASTER_SITE_GNU:=gcc/gcc-${PKG_VERSION}/}
PKG_RELEASE:=		1
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz
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
ifeq ($(ADK_TOOLCHAIN_GCC_4_9),y)
PKG_VERSION:=		4.9.4
PKG_HASH:=		1680f92781b92cbdb57d7e4f647c650678c594154cb0d707fd9a994424a9860d
PKG_SITES:=		${MASTER_SITE_GNU:=gcc/gcc-${PKG_VERSION}/}
PKG_RELEASE:=		1
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz
LIBSTDCXXVER:=		20
endif
ifeq ($(ADK_TOOLCHAIN_GCC_ARC),y)
PKG_VERSION:=		arc-2016.09-release
PKG_GIT:=		tag
PKG_SITES:=		https://github.com/foss-for-synopsys-dwc-arc-processors/gcc.git
PKG_RELEASE:=		1
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.xz
endif
ifeq ($(ADK_TOOLCHAIN_GCC_CSKY),y)
PKG_VERSION:=		gcc-6-branch-csky
PKG_GIT:=		branch
PKG_SITES:=		https://github.com/c-sky/gcc.git
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
ifeq ($(ADK_TOOLCHAIN_GCC_NDS32),y)
PKG_VERSION:=		4.9.3-nds32
PKG_HASH:=		b628ec1abf03c308b78b1c58d0e8fb90a50e48d195d4a8fc94b80fc1e290a9d5
PKG_SITES:=		http://distfiles.openadk.org/
PKG_RELEASE:=		1
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.xz
endif
ifeq ($(ADK_TOOLCHAIN_GCC_4_4),y)
PKG_VERSION:=		4.4.7
PKG_HASH:=		76ad7c433af1c798a1e116c4dfa8f5f794f0d32bff65f88c54dcd5e5d146fc32
PKG_SITES:=		${MASTER_SITE_GNU:=gcc/gcc-${PKG_VERSION}/}
PKG_RELEASE:=		1
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz
LIBSTDCXXVER:=		19
endif
ifeq ($(ADK_TOOLCHAIN_GCC_4_2),y)
PKG_VERSION:=		4.2.4
PKG_HASH:=		7cb75c5183bd18f415860084440377016dc78feeee2852227b831f2e4fcaa5d6
PKG_SITES:=		http://gcc.cybermirror.org/releases/gcc-${PKG_VERSION}/
PKG_RELEASE:=		1
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz
LIBSTDCXXVER:=		19
endif
ifeq ($(ADK_TOOLCHAIN_GCC_GIT),y)
PKG_VERSION:=		git
PKG_SITES:=		https://github.com/gcc-mirror/gcc.git
PKG_RELEASE:=		1
LIBSTDCXXVER:=		21
endif
