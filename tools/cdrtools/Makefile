# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		cdrtools
PKG_VERSION:=		3.00
PKG_RELEASE:=		1
PKG_MD5SUM:=		bb21cefefcfbb76cf249120e8978ffdd
PKG_SITES:=		ftp://ftp.berlios.de/pub/cdrecord/

include ../rules.mk

install: ${TOOLS_DIR}/mkisofs

$(WRKBUILD)/.compiled: ${WRKDIST}/.prepared
	#(cd ${WRKBUILD}; ./configure)
	${MAKE} -C ${WRKBUILD} CC='${CC_FOR_BUILD}'
	touch $@

${TOOLS_DIR}/mkisofs: $(WRKBUILD)/.compiled
	$(INSTALL_BIN) $(WRKBUILD)/mkisofs/OBJ/*/mkisofs \
		${TOOLS_DIR}

include $(TOPDIR)/mk/tools.mk
