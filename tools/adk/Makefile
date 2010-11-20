# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

$(TOPDIR)/bin/tools:
	@mkdir -p $(TOPDIR)/bin/tools

${TOPDIR}/bin/tools/depmaker: $(TOPDIR)/bin/tools
	$(HOSTCC) -o $(TOPDIR)/bin/tools/depmaker depmaker.c

${TOPDIR}/bin/tools/pkgrebuild: $(TOPDIR)/bin/tools
	$(HOSTCC) -o $(TOPDIR)/bin/tools/pkgrebuild pkgrebuild.c strmap.c

${TOPDIR}/bin/tools/dkgetsz: ${TOPDIR}/bin/tools
	${HOSTCC} -O2 -Wall -o $@ dkgetsz.c

install: ${TOPDIR}/bin/tools/depmaker ${TOPDIR}/bin/tools/pkgrebuild \
	${TOPDIR}/bin/tools/dkgetsz

include $(TOPDIR)/mk/tools.mk
