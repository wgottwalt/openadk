# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include ../rules.mk
include Makefile.inc


ifeq ($(ADK_CXX),y)
TARGET_LANGUAGES:=	c,c++
else
TARGET_LANGUAGES:=	c
endif

GCC_CONFOPTS=		--prefix=$(STAGING_TOOLS) \
			--build=$(GNU_HOST_NAME) \
			--host=$(GNU_HOST_NAME) \
			--target=$(REAL_GNU_TARGET_NAME) \
			--with-gmp=$(STAGING_TOOLS) \
			--with-mpfr=$(STAGING_TOOLS) \
			--disable-__cxa_atexit \
			--enable-target-optspace \
			--with-gnu-ld \
			--without-headers \
			--disable-libmudflap \
			--disable-libgomp \
			--disable-biarch \
			--disable-multilib \
			--disable-nls 

ifeq ($(ADK_SSP),y)
GCC_CONFOPTS+=		--enable-libssp
else
GCC_CONFOPTS+=		--disable-libssp
endif

ifeq ($(ADK_NO_FPU),y)
GCC_CONFOPTS+=		--with-float=soft
endif

ifeq ($(ADK_LINUX_MIPS64_LEMOTE),y)
GCC_CONFOPTS+=		--with-abi=64
endif

include ${TOPDIR}/mk/buildhlp.mk

GCC_BUILD_DIR1:=	$(WRKBUILD)-initial
GCC_BUILD_DIR2:=	$(WRKBUILD)-final

$(WRKBUILD)/.headers:
$(GCC_BUILD_DIR1)/.configured:
	rm -rf $(STAGING_TOOLS)/$(REAL_GNU_TARGET_NAME)/sys-include
	ln -sf ${STAGING_DIR}/include $(STAGING_TOOLS)/$(REAL_GNU_TARGET_NAME)/sys-include
	rm -rf ${STAGING_TOOLS}/$(REAL_GNU_TARGET_NAME)/lib
	ln -sf ${STAGING_DIR}/lib $(STAGING_TOOLS)/$(REAL_GNU_TARGET_NAME)/lib
	mkdir -p $(GCC_BUILD_DIR1)
	(cd $(GCC_BUILD_DIR1); rm -f config.cache; PATH=$(TARGET_PATH) \
		$(WRKBUILD)/configure \
		${GCC_CONFOPTS} \
		--enable-languages=c \
		--disable-shared \
		--with-sysroot=$(TOOLCHAIN_SYSROOT) \
	);
	touch $@

$(GCC_BUILD_DIR1)/.compiled: $(GCC_BUILD_DIR1)/.configured
	PATH=$(TARGET_PATH) $(MAKE) -C $(GCC_BUILD_DIR1) all-gcc all-target-libgcc
	touch $@

$(WRKBUILD)/.configure_done: $(GCC_BUILD_DIR1)/.compiled
	PATH=$(TARGET_PATH) $(MAKE) -C $(GCC_BUILD_DIR1) install-gcc install-target-libgcc
	touch $@

$(GCC_BUILD_DIR2)/.configured:
	mkdir -p $(GCC_BUILD_DIR2)
	(cd $(GCC_BUILD_DIR2); rm -f config.cache; PATH=$(TARGET_PATH) \
		$(WRKBUILD)/configure \
		${GCC_CONFOPTS} \
		--enable-languages=$(TARGET_LANGUAGES) \
		--with-sysroot=$(STAGING_DIR) \
		--with-slibdir=$(STAGING_DIR)/lib \
		--enable-shared \
	);
	touch $@

$(WRKBUILD)/.compiled: $(GCC_BUILD_DIR2)/.configured
	PATH=$(TARGET_PATH) $(MAKE) -C $(GCC_BUILD_DIR2) all
	touch $@

$(WRKBUILD)/.installed: $(WRKBUILD)/.compiled
	PATH=$(TARGET_PATH) $(MAKE) -C $(GCC_BUILD_DIR2) install
	echo $(GCC_VERSION) > $(STAGING_TOOLS)/gcc_version
	# Set up the symlinks to enable lying about target name.
	set -e; \
	(cd $(STAGING_TOOLS); \
		ln -sf $(REAL_GNU_TARGET_NAME) $(GNU_TARGET_NAME); \
		cd bin; \
		for app in $(REAL_GNU_TARGET_NAME)-* ; do \
			ln -sf $${app} \
		   	$(GNU_TARGET_NAME)$${app##$(REAL_GNU_TARGET_NAME)}; \
		done; \
	)
	touch $@

include ${TOPDIR}/mk/toolchain.mk
