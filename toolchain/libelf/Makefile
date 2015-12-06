# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk
include Makefile.inc
include ../rules.mk
include ${ADK_TOPDIR}/mk/buildhlp.mk

ifeq (${ADK_MAKE_PARALLEL},y)
LIBELF_MAKEOPTS+=		-j${ADK_MAKE_JOBS}
endif

$(WRKBUILD)/.configured:
	(cd $(WRKBUILD); \
		$(WRKBUILD)/configure \
		--prefix=$(STAGING_HOST_DIR)/usr \
		--disable-nls \
		--disable-shared \
		--enable-static \
	);
	touch $@

$(WRKBUILD)/.compiled: $(WRKBUILD)/.configured
	$(MAKE) ${LIBELF_MAKEOPTS} -C $(WRKBUILD) all
	touch $@

$(WRKBUILD)/.installed: $(WRKBUILD)/.compiled
	$(MAKE) -C $(WRKBUILD) install
	touch $@

include ${ADK_TOPDIR}/mk/toolchain.mk
