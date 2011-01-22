include $(TOPDIR)/rules.mk

all: mkimage.c crc32.c
	$(CC_FOR_BUILD) ${FLAGS_FOR_BUILD} -o ${STAGING_HOST_DIR}/bin/mkimage mkimage.c crc32.c
