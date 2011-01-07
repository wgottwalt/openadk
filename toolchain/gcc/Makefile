# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include ../rules.mk
include Makefile.inc

GCC_CONFOPTS=		--prefix=$(STAGING_HOST_DIR) \
			--build=$(GNU_HOST_NAME) \
			--host=$(GNU_HOST_NAME) \
			--target=$(REAL_GNU_TARGET_NAME) \
			--with-gmp=$(STAGING_HOST_DIR) \
			--with-mpfr=$(STAGING_HOST_DIR) \
			--disable-__cxa_atexit \
			--with-gnu-ld \
			--disable-libmudflap \
			--disable-libgomp \
			--disable-biarch \
			--disable-decimal-float \
			--disable-multilib \
			--disable-sjlj-exceptions \
			--disable-libstdcxx-pch \
			--disable-ppl-version-check \
			--disable-cloog-version-check \
			--without-ppl \
			--without-cloog \
			--disable-nls

ifeq ($(ADK_TOOLCHAIN_GCC_SSP),y)
GCC_CONFOPTS+=		--enable-libssp
else
GCC_CONFOPTS+=		--disable-libssp
endif

ifeq ($(ARCH),cris)
GCC_CONFOPTS+=		--disable-tls
else
GCC_CONFOPTS+=		--enable-tls
endif

ifeq ($(ARCH),powerpc)
GCC_CONFOPTS+=		--disable-target-optspace
else
GCC_CONFOPTS+=		--enable-target-optspace
endif

ifeq ($(ADK_TARGET_NO_FPU),y)
GCC_CONFOPTS+=		--with-float=soft
endif

ifeq ($(ADK_LINUX_MIPS64),y)
GCC_CONFOPTS+=		--with-abi=64
endif

ifeq ($(ADK_LINUX_MIPS64EL),y)
GCC_CONFOPTS+=		--with-abi=64
endif

ifeq (${ADK_MAKE_PARALLEL},y)
GCC_MAKEOPTS+=		-j${ADK_MAKE_JOBS}
endif

LANGUAGES:=c
ifeq ($(ADK_TOOLCHAIN_GCC_CXX),y)
LANGUAGES:=${LANGUAGES},c++
endif
ifeq ($(ADK_TOOLCHAIN_GCC_JAVA),y)
LANGUAGES:=${LANGUAGES},java
endif

include ${TOPDIR}/mk/buildhlp.mk

GCC_BUILD_DIR_MINIMAL:=	$(WRKBUILD)-minimal
GCC_BUILD_DIR_INITIAL:=	$(WRKBUILD)-initial
GCC_BUILD_DIR_FINAL:=	$(WRKBUILD)-final

$(GCC_BUILD_DIR_MINIMAL)/.configured:
	mkdir -p $(GCC_BUILD_DIR_MINIMAL)
	(cd $(GCC_BUILD_DIR_MINIMAL); rm -f config.cache; \
		PATH='$(TARGET_PATH)' \
		$(WRKBUILD)/configure \
			${GCC_CONFOPTS} \
			--enable-languages=c \
			--disable-shared \
			--with-newlib \
			--without-headers \
	);
	touch $@

$(GCC_BUILD_DIR_MINIMAL)/.compiled: $(GCC_BUILD_DIR_MINIMAL)/.configured
	PATH='$(TARGET_PATH)' \
	$(MAKE) ${GCC_MAKEOPTS} -C $(GCC_BUILD_DIR_MINIMAL) all-gcc
	touch $@

$(WRKBUILD)/.headers: $(GCC_BUILD_DIR_MINIMAL)/.compiled
	PATH='$(TARGET_PATH)' \
	$(MAKE) -C $(GCC_BUILD_DIR_MINIMAL) install-gcc
	touch $@

$(GCC_BUILD_DIR_INITIAL)/.configured:
	rm -rf $(STAGING_HOST_DIR)/$(REAL_GNU_TARGET_NAME)/sys-include
	ln -sf ${STAGING_TARGET_DIR}/include $(STAGING_HOST_DIR)/$(REAL_GNU_TARGET_NAME)/sys-include
	rm -rf ${STAGING_HOST_DIR}/$(REAL_GNU_TARGET_NAME)/lib
	ln -sf ${STAGING_TARGET_DIR}/lib $(STAGING_HOST_DIR)/$(REAL_GNU_TARGET_NAME)/lib
	mkdir -p $(GCC_BUILD_DIR_INITIAL)
	(cd $(GCC_BUILD_DIR_INITIAL); rm -f config.cache; \
		PATH='$(TARGET_PATH)' \
		$(WRKBUILD)/configure \
			${GCC_CONFOPTS} \
			--enable-languages=c \
			--disable-shared \
			--disable-threads \
			--with-newlib \
			--with-sysroot=$(TOOLCHAIN_SYSROOT) \
	);
	touch $@


$(GCC_BUILD_DIR_INITIAL)/.compiled: $(GCC_BUILD_DIR_INITIAL)/.configured
	PATH='$(TARGET_PATH)' \
	$(MAKE) ${GCC_MAKEOPTS} -C $(GCC_BUILD_DIR_INITIAL) all-gcc all-target-libgcc
	touch $@

$(WRKBUILD)/.configured: $(GCC_BUILD_DIR_INITIAL)/.compiled
	PATH='$(TARGET_PATH)' \
	$(MAKE) -C $(GCC_BUILD_DIR_INITIAL) install-gcc install-target-libgcc
	touch $@

$(GCC_BUILD_DIR_FINAL)/.configured:
	mkdir -p $(GCC_BUILD_DIR_FINAL)
	(cd $(GCC_BUILD_DIR_FINAL); rm -f config.cache; \
		PATH='$(TARGET_PATH)' \
		$(WRKBUILD)/configure \
			${GCC_CONFOPTS} \
			--enable-languages=$(LANGUAGES) \
			--with-sysroot='$${prefix}/${STAGING_HOST2TARGET}' \
			--with-slibdir=$(STAGING_TARGET_DIR)/lib \
			--enable-shared \
	);
	touch $@

$(WRKBUILD)/.compiled: $(GCC_BUILD_DIR_FINAL)/.configured
	PATH='$(TARGET_PATH)' \
	$(MAKE) ${GCC_MAKEOPTS} -C $(GCC_BUILD_DIR_FINAL) all
	touch $@

$(WRKBUILD)/.installed: $(WRKBUILD)/.compiled
	PATH='$(TARGET_PATH)' $(MAKE) -C $(GCC_BUILD_DIR_FINAL) install
	# workaround if you cross-compile binutils
	@-rm $(STAGING_TARGET_DIR)/lib/libiberty.a
	@-rm $(STAGING_TARGET_DIR)/usr/lib/libiberty.a
	# Set up the symlinks to enable lying about target name.
	set -e; \
	(cd $(STAGING_HOST_DIR); \
		ln -sf $(REAL_GNU_TARGET_NAME) $(GNU_TARGET_NAME); \
		cd bin; \
		for app in $(REAL_GNU_TARGET_NAME)-* ; do \
			ln -sf $${app} \
				$(GNU_TARGET_NAME)$${app##$(REAL_GNU_TARGET_NAME)}; \
		done; \
	)
	touch $@

include ${TOPDIR}/mk/toolchain.mk
