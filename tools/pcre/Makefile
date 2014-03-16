# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		pcre
PKG_VERSION:=		8.34
PKG_RELEASE:=		1
PKG_MD5SUM:=		006c5e27fb78cdd14a628fdfa5aa1905
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=pcre/}

include ../rules.mk

install: $(WRKBUILD)/.installed

$(WRKBUILD)/.configured: ${WRKDIST}/.prepared
	(cd ${WRKBUILD}; CPPFLAGS='$(CPPFLAGS_FOR_BUILD)' \
		LDFLAGS='$(LDFLAGS_FOR_BUILD)' \
		./configure --prefix=$(STAGING_HOST_DIR)/usr)
	@touch $@

$(WRKBUILD)/.compiled: $(WRKBUILD)/.configured
	${MAKE} -C ${WRKBUILD}
	@touch $@

$(WRKBUILD)/.installed: $(WRKBUILD)/.compiled
	${MAKE} -C ${WRKBUILD} install
	@touch $@

include $(TOPDIR)/mk/tools.mk
