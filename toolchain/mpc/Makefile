# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include Makefile.inc
include ../rules.mk
include ${TOPDIR}/mk/buildhlp.mk

ifeq (${ADK_MAKE_PARALLEL},y)
MPC_MAKEOPTS+=		-j${ADK_MAKE_JOBS}
endif

$(WRKBUILD)/.headers:
$(WRKBUILD)/.configured:
	(cd $(WRKBUILD); \
		$(WRKBUILD)/configure \
		--prefix=$(STAGING_HOST_DIR)/usr \
		--with-gmp=$(STAGING_HOST_DIR)/usr \
		--disable-shared \
		--enable-static \
	);
	touch $@

$(WRKBUILD)/.compiled: $(WRKBUILD)/.configured
	$(MAKE) ${MPC_MAKEOPTS} -C $(WRKBUILD) all
	touch $@

$(WRKBUILD)/.installed: $(WRKBUILD)/.compiled
	$(MAKE) -C $(WRKBUILD) install
	touch $@

include ${TOPDIR}/mk/toolchain.mk
