# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=	linux
PKG_VERSION:=	$(KERNEL_VERSION)
PKG_RELEASE:=	$(KERNEL_RELEASE)
PKG_MD5SUM:=	$(KERNEL_MD5SUM)
PKG_SITES:=  	${MASTER_SITE_KERNEL:=kernel/v3.0/} \
		${MASTER_SITE_KERNEL:=kernel/v3.0/testing/}
DISTFILES=	$(PKG_NAME)-$(PKG_VERSION).tar.xz
