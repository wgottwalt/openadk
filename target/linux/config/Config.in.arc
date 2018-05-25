# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

config ADK_LINUX_KERNEL_ISA_ARCOMPACT
	bool
	depends on ADK_TARGET_ARCH_ARC
	default y if ADK_TARGET_CPU_ARC_ARC700

config ADK_LINUX_KERNEL_ARC_CPU_770
	bool
	depends on ADK_TARGET_ARCH_ARC
	default y if ADK_TARGET_CPU_ARC_ARC700

config ADK_LINUX_KERNEL_ISA_ARCV2
	bool
	depends on ADK_TARGET_ARCH_ARC
	default y if ADK_TARGET_CPU_ARC_ARC_HS

config ADK_LINUX_KERNEL_ARC_BUILTIN_DTB_NAME
	string
	depends on ADK_TARGET_ARCH_ARC
	default "nsim_hs" if ADK_TARGET_CPU_ARC_ARC_HS
	default "nsim_700" if ADK_TARGET_CPU_ARC_ARC700
	

