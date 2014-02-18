# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

install: ${BIN_DIR}/depmaker ${BIN_DIR}/pkgrebuild ${BIN_DIR}/dkgetsz

${BIN_DIR}/depmaker: depmaker.c
	${CC_FOR_BUILD} ${FLAGS_FOR_BUILD} -o $@ depmaker.c

${BIN_DIR}/pkgrebuild: pkgrebuild.c strmap.c
	${CC_FOR_BUILD} ${FLAGS_FOR_BUILD} -o $@ pkgrebuild.c strmap.c

${BIN_DIR}/dkgetsz: dkgetsz.c
	${CC_FOR_BUILD} ${FLAGS_FOR_BUILD} -o $@ dkgetsz.c

include $(TOPDIR)/mk/tools.mk
