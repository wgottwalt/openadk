# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.
#
# On the various kernel version variables:
#
# KERNEL_FILE_VER: version numbering used for tarball and contained top level
#                  directory (e.g. linux-4.1.2.tar.bz2 -> linux-4.1.2) (not
#                  necessary equal to kernel's version, e.g. linux-3.19
#                  contains kernel version 3.19.0)
# KERNEL_RELEASE:  OpenADK internal versioning
# KERNEL_VERSION:  final kernel version how we want to identify a specific kernel

ifeq ($(ADK_TARGET_LINUX_KERNEL_VERSION_GIT),y)
KERNEL_FILE_VER:=	$(ADK_TARGET_LINUX_KERNEL_GIT)
KERNEL_RELEASE:=	1
KERNEL_VERSION:=	$(ADK_TARGET_LINUX_KERNEL_GIT_VER)-$(KERNEL_RELEASE)
endif
ifeq ($(ADK_TARGET_LINUX_KERNEL_VERSION_4_19),y)
KERNEL_FILE_VER:=	4.19.75
KERNEL_RELEASE:=	1
KERNEL_VERSION:=	$(KERNEL_FILE_VER)-$(KERNEL_RELEASE)
KERNEL_HASH:=		dd5e7147e1e4501560fba5beb86dae6bf6ba843518ab3d4cad283de77b651b78
endif
ifeq ($(ADK_TARGET_LINUX_KERNEL_VERSION_4_14),y)
KERNEL_FILE_VER:=	4.14.142
KERNEL_RELEASE:=	1
KERNEL_VERSION:=	$(KERNEL_FILE_VER)-$(KERNEL_RELEASE)
KERNEL_HASH:=		e67ba535991170a8383be68203af7d9b4262474ceeff2f9afedeac6043b590f3
endif
ifeq ($(ADK_TARGET_LINUX_KERNEL_VERSION_4_9),y)
KERNEL_FILE_VER:=	4.9.179
KERNEL_RELEASE:=	1
KERNEL_VERSION:=	$(KERNEL_FILE_VER)-$(KERNEL_RELEASE)
KERNEL_HASH:=		532e4b7b0103806dad9124fd09d15d19594eca08e7f900e94ff805d3b4171ee3
endif
ifeq ($(ADK_TARGET_LINUX_KERNEL_VERSION_4_4),y)
KERNEL_FILE_VER:=	4.4.132
KERNEL_RELEASE:=	1
KERNEL_VERSION:=	$(KERNEL_FILE_VER)-$(KERNEL_RELEASE)
KERNEL_HASH:=		c415b01c810ad88284f9ffaebe0526efce8b1643d930dac6d8ef6a55cf6e0634
endif
ifeq ($(ADK_TARGET_LINUX_KERNEL_VERSION_4_1),y)
KERNEL_FILE_VER:=	4.1.51
KERNEL_RELEASE:=	1
KERNEL_VERSION:=	$(KERNEL_FILE_VER)-$(KERNEL_RELEASE)
KERNEL_HASH:=		02285752a9da7a2e05c2a0fc8def00d73088bd3018ad3d7de876a1b81b382a11
endif
ifeq ($(ADK_TARGET_LINUX_KERNEL_VERSION_3_16),y)
KERNEL_FILE_VER:=	3.16.56
KERNEL_RELEASE:=	1
KERNEL_VERSION:=	$(KERNEL_FILE_VER)-$(KERNEL_RELEASE)
KERNEL_HASH:=		50a69d586b197b1f0dead9fef7232a39ecb25fafdcd6045e1d80db4d9e753cbb
endif
ifeq ($(ADK_TARGET_LINUX_KERNEL_VERSION_3_2),y)
KERNEL_FILE_VER:=	3.2.101
KERNEL_RELEASE:=	1
KERNEL_VERSION:=	$(KERNEL_FILE_VER)-$(KERNEL_RELEASE)
KERNEL_HASH:=		4453686b001685144f44c88d57c716fcb6e85ef8a2aad2f95d36df82fa972c59
endif
ifeq ($(ADK_TARGET_LINUX_KERNEL_VERSION_2_6_32),y)
KERNEL_FILE_VER:=	2.6.32.70
KERNEL_RELEASE:=	1
KERNEL_VERSION:=	$(KERNEL_FILE_VER)-$(KERNEL_RELEASE)
KERNEL_HASH:=		d7d0ee4588711d4f85ed67b65d447b4bbbe215e600a771fb87a62524b6341c43
endif
ifeq ($(ADK_TARGET_LINUX_KERNEL_VERSION_3_10_NDS32),y)
KERNEL_FILE_VER:=	3.10-nds32
KERNEL_RELEASE:=	1
KERNEL_VERSION:=	$(KERNEL_FILE_VER)-$(KERNEL_RELEASE)
KERNEL_HASH:=		2f3e06924b850ca4d383ebb6baed154e1bb20440df6f38ca47c33950ec0e05c5
endif
