# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

CCANDLD.c=	${HOSTCC} ${HOSTCFLAGS} ${HOSTCPPFLAGS} ${HOSTLDFLAGS}

${TOOLS_DIR}/depmaker:
	${CCANDLD.c} -Wall -o $@ depmaker.c

${TOOLS_DIR}/pkgrebuild:
	${CCANDLD.c} -Wall -o $@ pkgrebuild.c strmap.c

${TOOLS_DIR}/dkgetsz:
	${CCANDLD.c} -Wall -o $@ dkgetsz.c

install: ${TOOLS_DIR}/depmaker ${TOOLS_DIR}/pkgrebuild ${TOOLS_DIR}/dkgetsz

include $(TOPDIR)/mk/tools.mk
