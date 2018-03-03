# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=	waldux
PKG_RELEASE:=	$(KERNEL_RELEASE)
ifeq ($(ADK_TARGET_WALDUX_KERNEL_VERSION_GIT),y)
PKG_VERSION:=	$(ADK_TARGET_WALDUX_KERNEL_GIT)
PKG_GIT:=	$(ADK_TARGET_WALDUX_KERNEL_GIT_TYPE)
PKG_SITES:=	$(ADK_TARGET_WALDUX_KERNEL_GIT_REPO)
endif
