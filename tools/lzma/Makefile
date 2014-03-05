# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		lzma
PKG_VERSION:=		4.32.7
PKG_RELEASE:=		1
PKG_MD5SUM:=		434e51a018b4c8ef377bf81520a53af0
PKG_SITES:=		http://tukaani.org/lzma/

include ../rules.mk

install: ${STAGING_HOST_DIR}/usr/bin/lzma

$(WRKBUILD)/.compiled: ${WRKDIST}/.prepared
	(cd ${WRKBUILD}; PATH="$(STAGING_HOST_DIR)/usr/bin:$$PATH" ./configure)
	${MAKE} -C ${WRKBUILD} CC='${CC_FOR_BUILD}'
	touch $@

${STAGING_HOST_DIR}/usr/bin/lzma: $(WRKBUILD)/.compiled
	$(INSTALL_BIN) $(WRKBUILD)/src/lzma/lzma \
		$(STAGING_HOST_DIR)/usr/bin/lzma

include $(TOPDIR)/mk/tools.mk
