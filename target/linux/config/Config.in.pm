# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

config ADK_KERNEL_PM
	bool
	default y if ADK_TARGET_SYSTEM_SOLIDRUN_IMX6

config ADK_KERNEL_PM_RUNTIME
	bool
	default y if ADK_TARGET_SYSTEM_SOLIDRUN_IMX6

config ADK_KERNEL_ACPI
	bool

config ADK_KERNEL_ACPI_SYSFS_POWER
	bool

config ADK_KERNEL_ACPI_AC
	bool

config ADK_KERNEL_ACPI_BATTERY
	bool

config ADK_KERNEL_ACPI_BUTTON
	bool

config ADK_KERNEL_ACPI_FAN
	bool

config ADK_KERNEL_ACPI_DOCK
	bool

menu "Power Management support"
depends on ADK_TARGET_WITH_ACPI \
	|| ADK_TARGET_SYSTEM_LEMOTE_YEELONG \
	|| ADK_TARGET_GENERIC

config ADK_HARDWARE_ACPI
	bool "Enable ACPI support"
	select ADK_KERNEL_PM
	select ADK_KERNEL_PM_RUNTIME
	select ADK_KERNEL_ACPI
	select ADK_KERNEL_ACPI_SYSFS_POWER
	select ADK_KERNEL_ACPI_AC
	select ADK_KERNEL_ACPI_BATTERY
	select ADK_KERNEL_ACPI_BUTTON
	select ADK_KERNEL_ACPI_FAN
	select ADK_KERNEL_ACPI_DOCK
	default y if ADK_TARGET_SYSTEM_IBM_X40
	default y if ADK_TARGET_SYSTEM_PCENGINES_ALIX
	default y if ADK_TARGET_SYSTEM_PCENGINES_APU
	default y if ADK_TARGET_SYSTEM_GENERIC_X86
	default y if ADK_TARGET_SYSTEM_GENERIC_X86_64
	default y if ADK_TARGET_SYSTEM_ASUS_P5BVM
	default n
	help
	 Enable ACPI support.

config ADK_KERNEL_SUSPEND
	bool "Enable Suspend-to-RAM support"
	select ADK_KERNEL_PM
	select ADK_KERNEL_PM_RUNTIME
	default y if ADK_TARGET_SYSTEM_IBM_X40
	default y if ADK_TARGET_SYSTEM_LEMOTE_YEELONG
	default n
	help
	  Enable Suspend-to-RAM support.

config ADK_KERNEL_HIBERNATION
	bool "Enable Suspend-to-Disk support"
	select ADK_KERNEL_PM
	select ADK_KERNEL_PM_RUNTIME
	select ADK_KERNEL_SWAP
	select BUSYBOX_SWAPONOFF
	default y if ADK_TARGET_SYSTEM_IBM_X40
	default y if ADK_TARGET_SYSTEM_LEMOTE_YEELONG
	default n
	help
	  Enable Suspend-to-Disk support.

endmenu
