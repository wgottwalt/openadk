# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		grub
PKG_VERSION:=		1.98
PKG_RELEASE:=		1
PKG_MD5SUM:=		c0bcf60e524739bb64e3a2d4e3732a59
PKG_SITES:=		ftp://alpha.gnu.org/gnu/grub/

include ../rules.mk

$(WRKBUILD)/.compiled: ${WRKDIST}/.prepared
	cd $(WRKBUILD) && ./configure --prefix=$(TOPDIR)/bin/tools --disable-nls --disable-efiemu --with-platform=pc
	$(MAKE) -C $(WRKBUILD)
	touch $@

$(TOPDIR)/bin/tools/bin/grub-install: $(WRKBUILD)/.compiled
	$(MAKE) -C $(WRKBUILD) install

install: $(TOPDIR)/bin/tools/bin/grub-install

include $(TOPDIR)/mk/tools.mk
