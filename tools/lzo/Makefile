# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		lzo
PKG_VERSION:=		2.06
PKG_RELEASE:=		1
PKG_MD5SUM:=		95380bd4081f85ef08c5209f4107e9f8
PKG_SITES:=		http://www.oberhumer.com/opensource/lzo/download/

include ../rules.mk

install: $(WRKBUILD)/.installed

$(WRKBUILD)/.configured: ${WRKDIST}/.prepared
	(cd ${WRKBUILD}; ./configure --prefix=$(STAGING_HOST_DIR)/usr)
	@touch $@

$(WRKBUILD)/.compiled: $(WRKBUILD)/.configured
	${MAKE} -C ${WRKBUILD}
	@touch $@

$(WRKBUILD)/.installed: $(WRKBUILD)/.compiled
	${MAKE} -C ${WRKBUILD} install
	@touch $@

include $(TOPDIR)/mk/tools.mk
