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
depends on ADK_TARGET_WITH_ACPI || ADK_TARGET_SYSTEM_LEMOTE_YEELONG

config ADK_HARDWARE_ACPI
	prompt "Enable ACPI support"
	bool
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
	default y if ADK_TARGET_SYSTEM_PCENGINES_APU
	default n
	help
	 Enable ACPI support.

config ADK_KERNEL_SUSPEND
	prompt "Enable Suspend-to-RAM support"
	bool
	select ADK_KERNEL_PM
	select ADK_KERNEL_PM_RUNTIME
	default y if ADK_TARGET_SYSTEM_IBM_X40
	default y if ADK_TARGET_SYSTEM_LEMOTE_YEELONG
	default n
	help
	  Enable Suspend-to-RAM support.

config ADK_KERNEL_HIBERNATION
	prompt "Enable Suspend-to-Disk support"
	bool
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
