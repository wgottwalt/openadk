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
		./configure \
		--prefix=$(STAGING_HOST_DIR) \
		--with-pic \
		--disable-shared \
		--enable-static \
	)
	touch $@

$(WRKBUILD)/.compiled: $(WRKBUILD)/.configured
	$(MAKE) ${GMP_MAKEOPTS} -C $(WRKBUILD) all
	touch $@

$(WRKBUILD)/.installed: $(WRKBUILD)/.compiled
	$(MAKE) -C $(WRKBUILD) install
	touch $@

include ${TOPDIR}/mk/toolchain.mk
