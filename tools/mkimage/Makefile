# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

install: ${STAGING_HOST_DIR}/usr/bin/mkimage

${STAGING_HOST_DIR}/usr/bin/mkimage: mkimage.c crc32.c
	$(CC_FOR_BUILD) ${FLAGS_FOR_BUILD} -o $@ mkimage.c crc32.c

include $(TOPDIR)/mk/tools.mk
