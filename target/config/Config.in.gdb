# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

choice
prompt "GNU debugger version"
default ADK_TOOLCHAIN_GDB_H8300_GIT if ADK_TARGET_ARCH_H8300
default ADK_TOOLCHAIN_GDB_7_10_1

config ADK_TOOLCHAIN_GDB_GIT
	bool "git"
	depends on !ADK_TARGET_ARCH_AVR32
	depends on !ADK_TARGET_ARCH_BFIN
	depends on !ADK_TARGET_ARCH_H8300

config ADK_TOOLCHAIN_GDB_H8300_GIT
	bool "h8300-git"
	depends on ADK_TARGET_ARCH_H8300

config ADK_TOOLCHAIN_GDB_7_10_1
	bool "7.10.1"
	depends on !ADK_TARGET_ARCH_AVR32
	depends on !ADK_TARGET_ARCH_H8300

config ADK_TOOLCHAIN_GDB_7_9_1
	bool "7.9.1"
	depends on !ADK_TARGET_ARCH_AVR32
	depends on !ADK_TARGET_ARCH_H8300

config ADK_TOOLCHAIN_GDB_7_8_2
	bool "7.8.2"
	depends on !ADK_TARGET_ARCH_AVR32
	depends on !ADK_TARGET_ARCH_H8300

config ADK_TOOLCHAIN_GDB_6_7_1
	bool "6.7.1"
	depends on ADK_TARGET_ARCH_AVR32

endchoice
