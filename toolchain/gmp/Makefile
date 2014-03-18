# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include Makefile.inc
include ../rules.mk
include ${TOPDIR}/mk/buildhlp.mk

ifeq (${ADK_MAKE_PARALLEL},y)
GMP_MAKEOPTS+=		-j${ADK_MAKE_JOBS}
endif

$(WRKBUILD)/.headers:
$(WRKBUILD)/.configured:
ifneq ($(OStype),Darwin)
	(cd $(WRKBUILD); cp configfsf.guess config.guess)
endif
	(cd $(WRKBUILD); \
		PATH="$(STAGING_HOST_DIR)/usr/bin:$$PATH" \
		./configure \
		--prefix=$(STAGING_HOST_DIR)/usr \
		--with-pic \
		--disable-shared \
		--enable-static \
	)
	touch $@

$(WRKBUILD)/.compiled: $(WRKBUILD)/.configured
	env PATH="$(STAGING_HOST_DIR)/usr/bin:$$PATH" $(MAKE) ${GMP_MAKEOPTS} -C $(WRKBUILD) all
	touch $@

$(WRKBUILD)/.installed: $(WRKBUILD)/.compiled
	$(MAKE) -C $(WRKBUILD) install
	touch $@

include ${TOPDIR}/mk/toolchain.mk
