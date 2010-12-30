include $(TOPDIR)/rules.mk

all:
	$(HOSTCC) -c crc32.c -o crc32.o
	$(HOSTCC) -c mkimage.c -o mkimage.o
	$(HOSTCC) -o ${STAGING_HOST_DIR}/bin/mkimage mkimage.o crc32.o
