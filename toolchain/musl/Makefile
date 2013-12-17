# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include ../rules.mk
include Makefile.inc
include ${TOPDIR}/mk/buildhlp.mk

ifeq ($(CPU_ARCH),ppc)
REAL_GNU_TARGET_NAME:= $(subst ppc,powerpc,$(REAL_GNU_TARGET_NAME))
endif
ifeq ($(CPU_ARCH),mips64el)
REAL_GNU_TARGET_NAME:= $(subst mips64el,mips,$(REAL_GNU_TARGET_NAME))
endif
ifeq ($(CPU_ARCH),microblazeel)
REAL_GNU_TARGET_NAME:= $(subst microblazeel,microblaze,$(REAL_GNU_TARGET_NAME))
endif

$(WRKBUILD)/.headers:
	(cd $(WRKBUILD); CC='$(TARGET_CC)' CROSS_COMPILE='$(TARGET_CROSS)' \
		./configure --prefix=/usr \
		--target=$(REAL_GNU_TARGET_NAME) \
		--disable-gcc-wrapper \
	)
	$(MAKE) -C $(WRKBUILD) DESTDIR=$(STAGING_TARGET_DIR) install-headers
	touch $(WRKBUILD)/.configured
	touch $@

$(WRKBUILD)/.compiled:
	$(MAKE) CFLAGS='$(TARGET_CFLAGS)' -C $(WRKBUILD) all
	touch $@

$(WRKBUILD)/.installed: $(WRKBUILD)/.compiled
	$(MAKE) -C $(WRKBUILD) DESTDIR=$(STAGING_TARGET_DIR) install
	touch $@

$(WRKBUILD)/.fixup:
	# reconfigure musl, otherwise linking with libgcc or libgcc_eh is disabled
	$(MAKE) CFLAGS='$(TARGET_CFLAGS)' -C $(WRKBUILD) clean
	(cd $(WRKBUILD); CC='$(TARGET_CC)' CROSS_COMPILE='$(TARGET_CROSS)' \
		./configure --prefix=/usr \
		--target=$(REAL_GNU_TARGET_NAME) \
		--disable-gcc-wrapper \
	)
	$(MAKE) CFLAGS='$(TARGET_CFLAGS)' -C $(WRKBUILD) all
	$(MAKE) -C $(WRKBUILD) DESTDIR=$(STAGING_TARGET_DIR) install
	touch $@

include ${TOPDIR}/mk/toolchain.mk
