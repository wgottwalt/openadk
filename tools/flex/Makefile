# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		flex
PKG_VERSION:=		2.5.35
PKG_RELEASE:=		1
PKG_MD5SUM:=		201d3f38758d95436cbc64903386de0b
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=${PKG_NAME}/}

include ../rules.mk

install: ${STAGING_HOST_DIR}/usr/bin/flex

$(WRKBUILD)/.compiled: ${WRKDIST}/.prepared
	(cd ${WRKBUILD}; PATH="$(STAGING_HOST_DIR)/usr/bin:$$PATH" ./configure)
	${MAKE} -C ${WRKBUILD} CC='${CC_FOR_BUILD}'
	touch $@

${STAGING_HOST_DIR}/usr/bin/flex: $(WRKBUILD)/.compiled
	$(INSTALL_BIN) $(WRKBUILD)/flex \
		${STAGING_HOST_DIR}/usr/bin

include $(TOPDIR)/mk/tools.mk
