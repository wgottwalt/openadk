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

config ADK_TARGET_OS_RTEMS
	bool "RTEMS"
	help
	  Create a RTEMS appliance or toolchain.

config ADK_TARGET_OS_FROSTED
	bool "Frosted"
	help
	  Create a frosted appliance or toolchain.

config ADK_TARGET_OS_ZEPHYR
	bool "Zephyr"
	help
	  Create a zephyr appliance or toolchain.

endchoice

config ADK_TARGET_OS
	string
	default "linux" if ADK_TARGET_OS_LINUX
	default "frosted" if ADK_TARGET_OS_FROSTED
	default "rtems5.0.0" if ADK_TARGET_OS_RTEMS
	default "zephyr" if ADK_TARGET_OS_ZEPHYR
