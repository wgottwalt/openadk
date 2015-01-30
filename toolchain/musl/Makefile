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

$(WRKBUILD)/.headers:
	(cd $(WRKBUILD); CC='$(TARGET_CC)' CROSS_COMPILE='$(TARGET_CROSS)' \
		CFLAGS='$(TARGET_CFLAGS)' \
		./configure --prefix=/usr \
		--target=$(GNU_TARGET_NAME) \
		--disable-gcc-wrapper \
	)
	$(MAKE) -C $(WRKBUILD) DESTDIR=$(STAGING_TARGET_DIR) install-headers
	touch $(WRKBUILD)/.configured
	touch $@

$(WRKBUILD)/.compiled:
	# reconfigure musl, otherwise linking with libgcc or libgcc_eh is disabled
	$(MAKE) -C $(WRKBUILD) clean
	(cd $(WRKBUILD); CC='$(TARGET_CC)' CROSS_COMPILE='$(TARGET_CROSS)' \
		CFLAGS='$(TARGET_CFLAGS)' \
		./configure --prefix=/usr \
		--target=$(GNU_TARGET_NAME) \
		--disable-gcc-wrapper \
	)
	$(MAKE) -C $(WRKBUILD) CFLAGS='$(TARGET_CFLAGS)' all
	touch $@

$(WRKBUILD)/.installed: $(WRKBUILD)/.compiled
	$(MAKE) -C $(WRKBUILD) CFLAGS='$(TARGET_CFLAGS)' DESTDIR=$(STAGING_TARGET_DIR) install
	touch $@

$(WRKBUILD)/.fixup:
	# reconfigure musl, otherwise linking with libgcc or libgcc_eh is disabled
	$(MAKE) -C $(WRKBUILD) clean
	(cd $(WRKBUILD); CC='$(TARGET_CC)' CROSS_COMPILE='$(TARGET_CROSS)' \
		CFLAGS='$(TARGET_CFLAGS)' \
		./configure --prefix=/usr \
		--target=$(GNU_TARGET_NAME) \
		--disable-gcc-wrapper \
	)
	$(MAKE) -C $(WRKBUILD) CFLAGS='$(TARGET_CFLAGS)' all
	$(MAKE) -C $(WRKBUILD) CFLAGS='$(TARGET_CFLAGS)' DESTDIR=$(STAGING_TARGET_DIR) install
	# cleanup toolchain
	-find $(STAGING_TARGET_DIR) $(STAGING_HOST_DIR) -name \*.la -exec rm {} \;
ifeq ($(ADK_TARGET_TOOLCHAIN),y)
	# strip target libs and host tools for toolchain builds
	PATH="$(TARGET_PATH)" debug='0' prefix='${TARGET_CROSS}' ${BASH} ${SCRIPT_DIR}/rstrip.sh \
		$(STAGING_TARGET_DIR) $(TOOLCHAIN_DIR)/usr/lib/gcc/$(GNU_TARGET_NAME)
	debug='0' prefix=' ' ${BASH} ${SCRIPT_DIR}/rstrip.sh $(TOOLCHAIN_DIR)/usr/bin
endif
	touch $@

include ${ADK_TOPDIR}/mk/toolchain.mk
