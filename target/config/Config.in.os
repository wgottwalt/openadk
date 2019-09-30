# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

choice
prompt "Operating System"

config ADK_TARGET_OS_LINUX
	bool "Linux"
	help
	  Create a Linux system or toolchain.

config ADK_TARGET_OS_BAREMETAL
	bool "Bare metal"
	help
	  Create a bare metal appliance or toolchain.

endchoice

config ADK_TARGET_OS
	string
	default "linux" if ADK_TARGET_OS_LINUX
