# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include Makefile.inc
include ../rules.mk
include ${TOPDIR}/mk/buildhlp.mk

ifeq ($(ADK_TOOLCHAIN_WITH_SSP),y)
CONFOPTS+=		--enable-libssp
else
CONFOPTS+=		--disable-libssp
endif

ifeq ($(ADK_TOOLCHAIN_WITH_LTO),y)
CONFOPTS+=		--enable-lto
else
CONFOPTS+=		--disable-lto
endif

ifeq ($(ADK_TOOLCHAIN_WITH_GOLD),y)
CONFOPTS+=		--enable-gold
else
CONFOPTS+=		--disable-gold
endif

ifneq ($(ADK_LINUX_64)$(ADK_TARGET_KERNEL_64),)
CONFOPTS+=		--enable-64-bit-bfd
endif

ifeq ($(ADK_LINUX_SH)$(ADK_LINUX_X86_64),)
CONFOPTS+=		--disable-multilib
else
CONFOPTS+=		--enable-multilib
endif

ifeq (${ADK_MAKE_PARALLEL},y)
BINUTILS_MAKEOPTS+=	-j${ADK_MAKE_JOBS}
endif

$(WRKBUILD)/.headers:
$(WRKBUILD)/.configured:
	(cd $(WRKBUILD); \
		$(WRKBUILD)/configure \
		--prefix=$(TOOLCHAIN_DIR)/usr \
		--target=$(GNU_TARGET_NAME) \
		--with-sysroot=$(STAGING_TARGET_DIR) \
		--disable-dependency-tracking \
		--disable-libtool-lock \
		--disable-nls \
		--disable-werror \
		${CONFOPTS} \
	);
	touch $@

$(WRKBUILD)/.compiled: $(WRKBUILD)/.configured
	$(MAKE) ${BINUTILS_MAKEOPTS} -C $(WRKBUILD) all
	touch $@

$(WRKBUILD)/.installed: $(WRKBUILD)/.compiled
	$(MAKE) -C $(WRKBUILD) install
	touch $@

include ${TOPDIR}/mk/toolchain.mk
