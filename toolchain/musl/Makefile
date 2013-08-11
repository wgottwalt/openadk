# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include ../rules.mk
include Makefile.inc
include ${TOPDIR}/mk/buildhlp.mk

$(WRKBUILD)/.headers:
	(cd $(WRKBUILD); CC='$(TARGET_CC)' CROSS_COMPILE='$(TARGET_CROSS)' ./configure --prefix=/usr \
			--target=$(REAL_GNU_TARGET_NAME) \
			--disable-gcc-wrapper \
	)
	$(MAKE) -C $(WRKBUILD) DESTDIR=$(STAGING_TARGET_DIR) install-headers
	touch $(WRKBUILD)/.configured
	touch $@

$(WRKBUILD)/.compiled:
	$(MAKE) -C $(WRKBUILD) all
	touch $@

$(WRKBUILD)/.installed: $(WRKBUILD)/.compiled
	$(MAKE) -C $(WRKBUILD) DESTDIR=$(STAGING_TARGET_DIR) install
	touch $@

$(WRKBUILD)/.fixup:
	touch $@

include ${TOPDIR}/mk/toolchain.mk
