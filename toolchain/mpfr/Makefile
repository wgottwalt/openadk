# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include ../rules.mk
include $(TOPDIR)/toolchain/gmp/Makefile.inc
include Makefile.inc
include ${TOPDIR}/mk/buildhlp.mk

$(WRKBUILD)/.headers: 
$(WRKBUILD)/.configure_done: 
	(cd $(WRKBUILD); \
		$(WRKBUILD)/configure \
		--prefix=$(STAGING_TOOLS) \
		--build=$(GNU_HOST_NAME) \
		--host=$(GNU_HOST_NAME) \
		--with-gmp-build=$(GMP_BUILD_DIR) \
		--disable-shared \
		--enable-static \
	);
	touch $@

$(WRKBUILD)/.compiled: $(WRKBUILD)/.configure_done
	$(MAKE) -C $(WRKBUILD) all
	touch $@

$(WRKBUILD)/.installed: $(WRKBUILD)/.compiled
	$(MAKE) -C $(WRKBUILD) install
	touch $@

include ${TOPDIR}/mk/toolchain.mk
