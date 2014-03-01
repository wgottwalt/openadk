include $(TOPDIR)/rules.mk

all:
	$(MAKE) -C src CC="$(TARGET_CC)" LD="$(TARGET_CROSS)ld" CROSS_COMPILE="$(TARGET_CROSS)" \
		INCLUDE="-I$(LINUX_DIR)/arch/mips/include"
