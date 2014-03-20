# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include ../rules.mk
include Makefile.inc
include ${TOPDIR}/mk/buildhlp.mk

ifeq ($(CPU_ARCH),ppc)
GNU_TARGET_NAME:= $(subst ppc,powerpc,$(GNU_TARGET_NAME))
endif
ifeq ($(CPU_ARCH),mips64el)
GNU_TARGET_NAME:= $(subst mips64el,mips,$(GNU_TARGET_NAME))
endif
ifeq ($(CPU_ARCH),mips64)
GNU_TARGET_NAME:= $(subst mips64,mips,$(GNU_TARGET_NAME))
endif

$(WRKBUILD)/.headers:
	(cd $(WRKBUILD); CC='$(TARGET_CC)' CROSS_COMPILE='$(TARGET_CROSS)' \
		./configure --prefix=/usr \
		--target=$(GNU_TARGET_NAME) \
		--disable-gcc-wrapper \
	)
	$(MAKE) -C $(WRKBUILD) DESTDIR=$(STAGING_TARGET_DIR) install-headers
	touch $(WRKBUILD)/.configured
	touch $@

$(WRKBUILD)/.compiled:
	# reconfigure musl, otherwise linking with libgcc or libgcc_eh is disabled
	$(MAKE) CFLAGS='$(TARGET_CFLAGS)' -C $(WRKBUILD) clean
	(cd $(WRKBUILD); CC='$(TARGET_CC)' CROSS_COMPILE='$(TARGET_CROSS)' \
		./configure --prefix=/usr \
		--target=$(GNU_TARGET_NAME) \
		--disable-gcc-wrapper \
	)
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
		--target=$(GNU_TARGET_NAME) \
		--disable-gcc-wrapper \
	)
	$(MAKE) CFLAGS='$(TARGET_CFLAGS)' -C $(WRKBUILD) all
	$(MAKE) -C $(WRKBUILD) DESTDIR=$(STAGING_TARGET_DIR) install
	# cleanup toolchain
	-find $(STAGING_TARGET_DIR) $(STAGING_HOST_DIR) -name \*.la -delete
ifeq ($(ADK_TOOLCHAIN),y)
	# strip target libs and host tools for toolchain builds
	PATH="$(TARGET_PATH)" debug='0' prefix='${TARGET_CROSS}' ${BASH} ${SCRIPT_DIR}/rstrip.sh \
		$(STAGING_TARGET_DIR) $(TOOLCHAIN_DIR)/usr/lib/gcc/$(GNU_TARGET_NAME)
	debug='0' prefix=' ' ${BASH} ${SCRIPT_DIR}/rstrip.sh $(TOOLCHAIN_DIR)/usr/bin
endif
	touch $@

include ${TOPDIR}/mk/toolchain.mk
