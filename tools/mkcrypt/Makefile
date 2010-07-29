# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

${STAGING_TOOLS}/bin/mkcrypt:
	$(HOSTCC) -o $(STAGING_TOOLS)/bin/mkcrypt mkcrypt.c

install: ${STAGING_TOOLS}/bin/mkcrypt

include $(TOPDIR)/mk/tools.mk
