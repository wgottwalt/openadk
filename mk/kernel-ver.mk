ifeq ($(ADK_KERNEL_VERSION_3_18_5),y)
KERNEL_VERSION:=	3.18.5
KERNEL_MOD_VERSION:=	$(KERNEL_VERSION)
KERNEL_RELEASE:=	1
KERNEL_HASH:=		e4442436e59c74169e98d38d2e2a434c7b73f8eda0aa8f20e454eaf52270fc90
endif
ifeq ($(ADK_KERNEL_VERSION_3_14_28),y)
KERNEL_VERSION:=	3.14.28
KERNEL_MOD_VERSION:=	$(KERNEL_VERSION)
KERNEL_RELEASE:=	1
KERNEL_HASH:=		772dbf0f3454df3fcad2de58f2bf4d8695c657407a76957b44e00c79f1ef5321
endif
ifeq ($(ADK_KERNEL_VERSION_3_12_37),y)
KERNEL_VERSION:=	3.12.37
KERNEL_MOD_VERSION:=	$(KERNEL_VERSION)
KERNEL_RELEASE:=	1
KERNEL_HASH:=		5da2b83a4747601295a8570fb6fa46b51d977fecabd3dfddf7478c331b36ed5c
endif
ifeq ($(ADK_KERNEL_VERSION_3_10_53),y)
KERNEL_VERSION:=	3.10.53
KERNEL_MOD_VERSION:=	$(KERNEL_VERSION)
KERNEL_RELEASE:=	1
KERNEL_HASH:=		06c3ec0849d4687c8b6379b9586dc9662730fc280d494f897c2ef9fbee35aaeb
endif
ifeq ($(ADK_KERNEL_VERSION_3_4_103),y)
KERNEL_VERSION:=	3.4.103
KERNEL_MOD_VERSION:=	$(KERNEL_VERSION)
KERNEL_RELEASE:=	1
KERNEL_HASH:=		2f128cf4007acd1a5fc5c27badfc385bb231109aaf0fba7fd9bcf9766852afd1
endif
