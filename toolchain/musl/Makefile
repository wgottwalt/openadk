# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk
include ../rules.mk
include Makefile.inc
include ${ADK_TOPDIR}/mk/buildhlp.mk

ifeq ($(ADK_TARGET_CPU_ARCH),ppc)
GNU_TARGET_NAME:= $(subst ppc,powerpc,$(GNU_TARGET_NAME))
endif
# not yet possible
TARGET_CFLAGS:=		$(filter-out -fstack-protector-all,$(TARGET_CFLAGS))
TARGET_LDFLAGS:=	$(filter-out -fstack-protector-all,$(TARGET_LDFLAGS))
# don't use fast-math for C library
TARGET_CFLAGS:=         $(filter-out -ffast-math,$(TARGET_CFLAGS))

$(WRKBUILD)/.configured:
	(cd $(WRKBUILD); CC='$(TARGET_CC)' CROSS_COMPILE='$(TARGET_CROSS)' \
		CFLAGS='$(TARGET_CFLAGS)' \
		./configure --prefix=/usr \
		--target=$(GNU_TARGET_NAME) \
		--disable-gcc-wrapper \
	)
	touch $@

$(WRKBUILD)/.compiled:
	$(MAKE) -C $(WRKBUILD) CFLAGS='$(TARGET_CFLAGS)' all
	touch $@

$(WRKBUILD)/.installed: $(WRKBUILD)/.compiled
	$(MAKE) -C $(WRKBUILD) CFLAGS='$(TARGET_CFLAGS)' DESTDIR=$(STAGING_TARGET_DIR) install
	touch $@

$(WRKBUILD)/.final:
	touch $@

include ${ADK_TOPDIR}/mk/toolchain.mk
