# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=		gcc
ifeq ($(ADK_LINUX_AARCH64),y)
PKG_VERSION:=		4.9.1
PKG_MD5SUM:=		b188a3c9be25ddbf36b4fa6f04aaafaa
else
PKG_VERSION:=		4.8.3
PKG_MD5SUM:=		e2c60f5ef918be2db08df96c7d97d0c4
endif
PKG_RELEASE:=		1
PKG_SITES:=		${MASTER_SITE_GNU:=gcc/gcc-${PKG_VERSION}/}
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz
