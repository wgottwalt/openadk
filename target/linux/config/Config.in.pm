config ADK_KERNEL_PM
	boolean

config ADK_KERNEL_ACPI
	boolean

config ADK_KERNEL_ACPI_SYSFS_POWER
	boolean

config ADK_KERNEL_ACPI_AC
	boolean

config ADK_KERNEL_ACPI_BATTERY
	boolean

config ADK_KERNEL_ACPI_BUTTON
	boolean

config ADK_KERNEL_ACPI_FAN
	boolean

config ADK_KERNEL_ACPI_DOCK
	boolean

menu "Power Management support"

config ADK_HARDWARE_ACPI
	prompt "Enable ACPI support"
	boolean
	select ADK_KERNEL_PM
	select ADK_KERNEL_ACPI
	select ADK_KERNEL_ACPI_SYSFS_POWER
	select ADK_KERNEL_ACPI_AC
	select ADK_KERNEL_ACPI_BATTERY
	select ADK_KERNEL_ACPI_BUTTON
	select ADK_KERNEL_ACPI_FAN
	select ADK_KERNEL_ACPI_DOCK
	default y if ADK_TARGET_SYSTEM_IBM_X40
	default n
	help
	 Enable ACPI support.

config ADK_KERNEL_SUSPEND
	prompt "Enable Suspend support"
	boolean
	select ADK_KERNEL_PM
	default y if ADK_TARGET_SYSTEM_IBM_X40
	default n
	help
	  Enable Suspend-to-RAM and Suspend-to-Disk support.

endmenu
