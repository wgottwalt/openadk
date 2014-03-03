# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include Makefile.inc
include ../rules.mk
include ${TOPDIR}/mk/buildhlp.mk

ifeq ($(ADK_TOOLCHAIN_GCC_SSP),y)
CONFOPTS+=		--enable-libssp
else
CONFOPTS+=		--disable-libssp
endif

ifeq ($(ADK_TARGET_SYSTEM_RASPBERRY_PI),y)
CONFOPTS+=          	--with-arch=armv6
endif

ifneq ($(strip $(ADK_LINUX_64)$(ADK_TARGET_KERNEL64)),)
CONFOPTS+=		--enable-64-bit-bfd
endif

ifeq (${ADK_MAKE_PARALLEL},y)
BINUTILS_MAKEOPTS+=	-j${ADK_MAKE_JOBS}
endif

$(WRKBUILD)/.headers:
$(WRKBUILD)/.configured:
	(cd $(WRKBUILD); \
		$(WRKBUILD)/configure \
		--prefix=$(STAGING_HOST_DIR) \
		--target=$(GNU_TARGET_NAME) \
		--with-sysroot=$(STAGING_TARGET_DIR) \
		--disable-multilib \
		--disable-dependency-tracking \
		--disable-libtool-lock \
		--disable-nls \
		--disable-werror \
		--disable-plugins \
		${CONFOPTS} \
	);
	touch $@

$(WRKBUILD)/.compiled: $(WRKBUILD)/.configured
	$(MAKE) ${BINUTILS_MAKEOPTS} -C $(WRKBUILD) all
	touch $@

$(WRKBUILD)/.installed: $(WRKBUILD)/.compiled
	$(MAKE) -C $(WRKBUILD) install
	# needed on hosts without readelf, but strange things happen on Cygwin.
ifeq (${OStype},Darwin)
	$(CP) $(WRKBUILD)/binutils/readelf $(STAGING_HOST_DIR)/bin
endif
	touch $@

include ${TOPDIR}/mk/toolchain.mk
