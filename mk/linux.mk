# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=	linux
PKG_RELEASE:=	$(KERNEL_RELEASE)
ifeq ($(ADK_TARGET_KERNEL_VERSION_GIT),y)
ifneq ($(ADK_TARGET_KERNEL_HASH),)
PKG_VERSION:=	$(ADK_TARGET_KERNEL_HASH)
else
PKG_VERSION:=	git
endif
PKG_SITES:=	$(ADK_TARGET_KERNEL_REPO)
else
PKG_VERSION:=	$(KERNEL_FILE_VER)
PKG_HASH:=	$(KERNEL_HASH)
PKG_SITES:=  	${MASTER_SITE_KERNEL:=kernel/v4.x/} \
		${MASTER_SITE_KERNEL:=kernel/v3.x/} \
		${MASTER_SITE_KERNEL:=kernel/v3.0/testing/} \
		${MASTER_SITE_KERNEL:=kernel/v4.x/testing/} \
		${MASTER_SITE_KERNEL:=kernel/v2.6/longterm/v2.6.32/}
DISTFILES=	$(PKG_NAME)-$(PKG_VERSION).tar.xz
endif
