# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

install: ${BIN_DIR}/mkcrypt

${BIN_DIR}/mkcrypt:
	$(CC_FOR_BUILD) ${FLAGS_FOR_BUILD} -o $@ mkcrypt.c

include $(TOPDIR)/mk/tools.mk
