# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=		gcc
ifeq ($(ADK_TOOLCHAIN_GCC_9),y)
PKG_VERSION:=		9.2.0
PKG_HASH:=		ea6ef08f121239da5695f76c9b33637a118dcf63e24164422231917fa61fb206
PKG_SITES:=		${MASTER_SITE_GNU:=gcc/gcc-${PKG_VERSION}/}
PKG_RELEASE:=		1
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.xz
LIBSTDCXXVER:=		25
endif
ifeq ($(ADK_TOOLCHAIN_GCC_8),y)
PKG_VERSION:=		8.3.0
PKG_HASH:=		64baadfe6cc0f4947a84cb12d7f0dfaf45bb58b7e92461639596c21e02d97d2c
PKG_SITES:=		${MASTER_SITE_GNU:=gcc/gcc-${PKG_VERSION}/}
PKG_RELEASE:=		1
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.xz
LIBSTDCXXVER:=		24
endif
ifeq ($(ADK_TOOLCHAIN_GCC_7),y)
PKG_VERSION:=		7.4.0
PKG_HASH:=		eddde28d04f334aec1604456e536416549e9b1aa137fc69204e65eb0c009fe51
PKG_SITES:=		${MASTER_SITE_GNU:=gcc/gcc-${PKG_VERSION}/}
PKG_RELEASE:=		1
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.xz
LIBSTDCXXVER:=		23
endif
ifeq ($(ADK_TOOLCHAIN_GCC_ARC),y)
PKG_VERSION:=		arc-2018.03-release
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
ifeq ($(ADK_TOOLCHAIN_GCC_METAG),y)
PKG_VERSION:=		4.2.4
PKG_HASH:=		7cb75c5183bd18f415860084440377016dc78feeee2852227b831f2e4fcaa5d6
PKG_SITES:=		http://gcc.cybermirror.org/releases/gcc-${PKG_VERSION}/
PKG_RELEASE:=		1
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz
LIBSTDCXXVER:=		19
endif
ifeq ($(ADK_TOOLCHAIN_GCC_LM32),y)
PKG_VERSION:=		4.5.2
PKG_HASH:=		07b880faf29f3f9d9c0953717002ac29f5d061427797d2487a7c9c169e6395b3
PKG_SITES:=		https://ftp.gnu.org/gnu/gcc/gcc-$(PKG_VERSION)/
PKG_RELEASE:=		1
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz
LIBSTDCXXVER:=		19
endif
ifeq ($(ADK_TOOLCHAIN_GCC_NDS32),y)
PKG_VERSION:=		nds32-6.3.0-open
PKG_HASH:=		b23ce96df25dfdd5526496a3c2cd7ee1da4ed4094971a2e0c47c73ad7e1ad30a
PKG_SITES:=		https://github.com/andestech/gcc.git
PKG_RELEASE:=		1
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.xz
endif
ifeq ($(ADK_TOOLCHAIN_GCC_GIT),y)
PKG_VERSION:=		git
PKG_SITES:=		https://github.com/gcc-mirror/gcc.git
PKG_RELEASE:=		1
LIBSTDCXXVER:=		23
endif
