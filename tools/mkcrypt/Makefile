# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

${TOOLS_DIR}/mkcrypt:
	$(HOSTCC) ${HOSTCFLAGS} -o $@ mkcrypt.c

install: ${TOOLS_DIR}/mkcrypt

include $(TOPDIR)/mk/tools.mk
