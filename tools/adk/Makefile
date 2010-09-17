# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

${TOPDIR}/bin/tools/depmaker:
	$(HOSTCC) -o $(TOPDIR)/bin/tools/depmaker depmaker.c

${TOPDIR}/bin/tools/pkgrebuild:
	$(HOSTCC) -o $(TOPDIR)/bin/tools/pkgrebuild pkgrebuild.c strmap.c

install: ${TOPDIR}/bin/tools/depmaker ${TOPDIR}/bin/tools/pkgrebuild

include $(TOPDIR)/mk/tools.mk
