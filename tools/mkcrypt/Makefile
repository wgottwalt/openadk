# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

${TOPDIR}/bin/tools/mkcrypt:
	$(HOSTCC) -o $(TOPDIR)/bin/tools/mkcrypt mkcrypt.c

install: ${TOPDIR}/bin/tools/mkcrypt

include $(TOPDIR)/mk/tools.mk
