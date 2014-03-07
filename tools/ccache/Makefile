# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		ccache
PKG_VERSION:=		3.1.9
PKG_RELEASE:=		1
PKG_MD5SUM:=		a5e9954b1dae036762f7b13673a2cf76
PKG_SITES:=		http://samba.org/ftp/ccache/

include ../rules.mk

install: ${STAGING_HOST_DIR}/usr/bin/ccache

$(WRKBUILD)/.compiled: ${WRKDIST}/.prepared
	(cd ${WRKBUILD}; ./configure --prefix=$(STAGING_HOST_DIR)/usr)
	${MAKE} -C ${WRKBUILD} CC='${CC_FOR_BUILD}'
	touch $@

${STAGING_HOST_DIR}/usr/bin/ccache: $(WRKBUILD)/.compiled
	$(INSTALL_BIN) $(WRKBUILD)/ccache \
		${STAGING_HOST_DIR}/usr/bin

include $(TOPDIR)/mk/tools.mk
