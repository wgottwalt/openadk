# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

${TOPDIR}/bin/tools/depmaker:
	$(HOSTCC) -o $(TOPDIR)/bin/tools/depmaker depmaker.c

install: ${TOPDIR}/bin/tools/depmaker

include $(TOPDIR)/mk/tools.mk
