include $(TOPDIR)/rules.mk

all:
	$(HOSTCC) -c crc32.c -o crc32.o
	$(HOSTCC) -c mkimage.c -o mkimage.o
	$(HOSTCC) -o ${STAGING_TOOLS}/bin/mkimage mkimage.o crc32.o
