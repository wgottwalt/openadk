# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=	linux
PKG_VERSION:=	$(KERNEL_VERSION)
PKG_RELEASE:=	$(KERNEL_RELEASE)
PKG_HASH:=	$(KERNEL_HASH)
PKG_SITES:=  	${MASTER_SITE_KERNEL:=kernel/v4.x/} \
		${MASTER_SITE_KERNEL:=kernel/v3.x/} \
		${MASTER_SITE_KERNEL:=kernel/v3.0/testing/} \
		${MASTER_SITE_KERNEL:=kernel/v2.6/longterm/v2.6.32/}
DISTFILES=	$(PKG_NAME)-$(PKG_VERSION).tar.xz
