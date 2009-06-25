# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include ../rules.mk
include Makefile.inc
include ${TOPDIR}/mk/buildhlp.mk

ifeq ($(ADK_SSP),y)
CONFOPTS+=		--enable-libssp
else
CONFOPTS+=		--disable-libssp
endif

ifeq ($(ADK_LINUX_64),y)
CONFOPTS+=		--enable-64-bit-bfd
endif

$(WRKBUILD)/.headers: 
$(WRKBUILD)/.configure_done: 
	(cd $(WRKBUILD); \
		$(WRKBUILD)/configure \
		--prefix=$(STAGING_TOOLS) \
		--build=$(GNU_HOST_NAME) \
		--host=$(GNU_HOST_NAME) \
		--target=$(REAL_GNU_TARGET_NAME) \
		--disable-nls \
		--with-sysroot=$(TOOLCHAIN_SYSROOT) \
		--with-sysroot=$(STAGING_DIR) \
		--disable-multilib \
		--disable-dependency-tracking \
		--disable-libtool-lock \
		--disable-werror \
		${CONFOPTS} \
	);
	touch $@

$(WRKBUILD)/.compiled: $(WRKBUILD)/.configure_done
	$(MAKE) -C $(WRKBUILD) all
	touch $@

$(WRKBUILD)/.installed: $(WRKBUILD)/.compiled
	$(MAKE) -C $(WRKBUILD) install
	touch $@

include ${TOPDIR}/mk/toolchain.mk
