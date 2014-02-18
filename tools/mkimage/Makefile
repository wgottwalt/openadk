# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

install: ${BIN_DIR}/mkimage

${BIN_DIR}/mkimage: mkimage.c crc32.c
	$(CC_FOR_BUILD) ${FLAGS_FOR_BUILD} -o $@ mkimage.c crc32.c

include $(TOPDIR)/mk/tools.mk
