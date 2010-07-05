# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		mkcrypt
PKG_VERSION:=		0.1
PKG_RELEASE:=		1
NO_DISTFILES:=		1

include ../rules.mk

$(WRKBUILD)/.compiled: ${WRKDIST}/.prepared
	$(HOSTCC) -o $(WRKBUILD)/mkcrypt mkcrypt.c
	touch $@

$(WRKBUILD)/.installed: $(WRKBUILD)/.compiled
	$(INSTALL_BIN) $(WRKBUILD)/mkcrypt \
		${STAGING_TOOLS}/bin
	touch $@

include $(TOPDIR)/mk/tools.mk
