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

ifeq ($(ADK_TARGET_KERNEL_VERSION_GIT),y)
KERNEL_FILE_VER:=	$(ADK_TARGET_KERNEL_GIT)
KERNEL_RELEASE:=	1
KERNEL_VERSION:=	$(ADK_TARGET_KERNEL_GIT_VER)-$(KERNEL_RELEASE)
endif
ifeq ($(ADK_TARGET_KERNEL_VERSION_4_12),y)
KERNEL_FILE_VER:=	4.12.3
KERNEL_RELEASE:=	1
KERNEL_VERSION:=	$(KERNEL_FILE_VER)-$(KERNEL_RELEASE)
KERNEL_HASH:=		99bd9db1228ef60eb620071abac899d2774255bfa43d06acbdc732a17e2ebf16
endif
ifeq ($(ADK_TARGET_KERNEL_VERSION_4_9),y)
KERNEL_FILE_VER:=	4.9.38
KERNEL_RELEASE:=	1
KERNEL_VERSION:=	$(KERNEL_FILE_VER)-$(KERNEL_RELEASE)
KERNEL_HASH:=		76d789d87dd51d2fd58c095727171984fa4a992f5e25b9e3eb1e5fd5cd129074
endif
ifeq ($(ADK_TARGET_KERNEL_VERSION_4_6),y)
KERNEL_FILE_VER:=	4.6.2
KERNEL_RELEASE:=	1
KERNEL_VERSION:=	$(KERNEL_FILE_VER)-$(KERNEL_RELEASE)
KERNEL_HASH:=		e158f3c69da87c2ec28d0f194dbe18b05e0d0b9e1142566615cea3390bab1c6a
endif
ifeq ($(ADK_TARGET_KERNEL_VERSION_4_4),y)
KERNEL_FILE_VER:=	4.4.77
KERNEL_RELEASE:=	1
KERNEL_VERSION:=	$(KERNEL_FILE_VER)-$(KERNEL_RELEASE)
KERNEL_HASH:=		5e7b7076c319ffc7db571a8eda9316b1b3477ca4ad0d45120fc9d40bc72ab4e8
endif
ifeq ($(ADK_TARGET_KERNEL_VERSION_4_1),y)
KERNEL_FILE_VER:=	4.1.42
KERNEL_RELEASE:=	1
KERNEL_VERSION:=	$(KERNEL_FILE_VER)-$(KERNEL_RELEASE)
KERNEL_HASH:=		ba1097907273b7e85dd3c6ffced346a2a2d8458893f0fc4c3fdb0d198aea04bd
endif
ifeq ($(ADK_TARGET_KERNEL_VERSION_3_16),y)
KERNEL_FILE_VER:=	3.16.43
KERNEL_RELEASE:=	1
KERNEL_VERSION:=	$(KERNEL_FILE_VER)-$(KERNEL_RELEASE)
KERNEL_HASH:=		93843c6a14e774327950159cade4c2c54ba105617275e4b595555ca9c34bc1e3
endif
ifeq ($(ADK_TARGET_KERNEL_VERSION_3_10),y)
KERNEL_FILE_VER:=	3.10.105
KERNEL_RELEASE:=	1
KERNEL_VERSION:=	$(KERNEL_FILE_VER)-$(KERNEL_RELEASE)
KERNEL_HASH:=		1c5bcc129cbbe2f665e8446b4c2fdbec0ec5f2b5d40495abfba13bbf66ac699c
endif
ifeq ($(ADK_TARGET_KERNEL_VERSION_3_4),y)
KERNEL_FILE_VER:=	3.4.113
KERNEL_RELEASE:=	1
KERNEL_VERSION:=	$(KERNEL_FILE_VER)-$(KERNEL_RELEASE)
KERNEL_HASH:=		c474a1d630357e64ae89f374a2575fa9623e87ea1a97128c4d83f08d4e7a0b4f
endif
ifeq ($(ADK_TARGET_KERNEL_VERSION_3_2),y)
KERNEL_FILE_VER:=	3.2.88
KERNEL_RELEASE:=	1
KERNEL_VERSION:=	$(KERNEL_FILE_VER)-$(KERNEL_RELEASE)
KERNEL_HASH:=		426d254322c521dcb16606d6a390b8600e4f6ccf0edd03bbffc582d6cda1429c
endif
ifeq ($(ADK_TARGET_KERNEL_VERSION_2_6_32),y)
KERNEL_FILE_VER:=	2.6.32.70
KERNEL_RELEASE:=	1
KERNEL_VERSION:=	$(KERNEL_FILE_VER)-$(KERNEL_RELEASE)
KERNEL_HASH:=		d7d0ee4588711d4f85ed67b65d447b4bbbe215e600a771fb87a62524b6341c43
endif
ifeq ($(ADK_TARGET_KERNEL_VERSION_3_4_NDS32),y)
KERNEL_FILE_VER:=	3.4-nds32
KERNEL_RELEASE:=	1
KERNEL_VERSION:=	$(KERNEL_FILE_VER)-$(KERNEL_RELEASE)
KERNEL_HASH:=		d942fb778395a491a44b144c8542bafd8ef9bb5ffb6650ce94e6304a913361c9
endif
