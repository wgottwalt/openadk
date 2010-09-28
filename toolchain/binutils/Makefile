# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include Makefile.inc
include ../rules.mk
include ${TOPDIR}/mk/buildhlp.mk

ifeq ($(ADK_LINUX_64),y)
CONFOPTS+=		--enable-64-bit-bfd
endif

ifeq (${ADK_MAKE_PARALLEL},y)
BINUTILS_MAKEOPTS+=	-j${ADK_MAKE_JOBS}
endif

$(WRKBUILD)/.headers:
$(WRKBUILD)/.configured:
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
		--disable-libssp \
		${CONFOPTS} \
	);
	touch $@

$(WRKBUILD)/.compiled: $(WRKBUILD)/.configured
	$(MAKE) ${BINUTILS_MAKEOPTS} -C $(WRKBUILD) all
	touch $@

$(WRKBUILD)/.installed: $(WRKBUILD)/.compiled
	$(MAKE) -C $(WRKBUILD) install
	# needed on hosts without readelf
	$(CP) $(WRKBUILD)/binutils/readelf $(STAGING_TOOLS)/bin
	touch $@

include ${TOPDIR}/mk/toolchain.mk
