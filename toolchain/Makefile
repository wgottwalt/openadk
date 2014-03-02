# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.
#
# Steps to build toolchains
# 1) build and install binutils
# 2) build and install mpfr, mpc, libelf and gmp
# 3) build and install minimal gcc c compiler
# 4) install kernel-headers
# 5) install libc headers
# 6) build and install initial static gcc
# 7) build and install full libc
# 8) build and install full shared gcc
# 9) rebuild and install full libc (in case of musl/uclibc)
# 10) build and install gdb debugger

include $(TOPDIR)/rules.mk

TARGETS:=binutils gmp mpfr mpc libelf gcc
ifeq ($(ADK_TARGET_LIB_GLIBC),y)
TARGETS+=glibc
LIBC:=glibc
endif
ifeq ($(ADK_TARGET_LIB_UCLIBC),y)
TARGETS+=uClibc
LIBC:=uClibc
endif
ifeq ($(ADK_TARGET_LIB_MUSL),y)
TARGETS+=musl
LIBC:=musl
endif
ifeq ($(ADK_TOOLCHAIN_GDB),y)
TARGETS+=gdb
endif

DOWNLOAD:=kernel-headers-download $(patsubst %,%-download,$(TARGETS))
TARGETS_INSTALL:=$(patsubst %,%-install,$(TARGETS))
FIXUP:=$(patsubst %,%-fixup,$(LIBC))
TARGETS_CLEAN:=$(patsubst %,%-clean,$(TARGETS))

install: $(TARGETS_INSTALL)
clean: $(TARGETS_CLEAN)
download: $(DOWNLOAD)
fixup: $(FIXUP)

gcc-prepare: binutils-install gmp-install mpfr-install mpc-install libelf-install
$(LIBC)-prepare: gcc-prepare kernel-headers-prepare
gcc-configure: $(LIBC)-prepare
$(LIBC)-compile: gcc-configure
gcc-compile: $(LIBC)-install
ifeq ($(ADK_TOOLCHAIN_GDB),y)
$(LIBC)-fixup: gcc-install gdb-install
else
$(LIBC)-fixup: gcc-install
endif

$(STAGING_HOST_DIR):
	@mkdir -p $(STAGING_HOST_DIR)/lib
	@mkdir -p $(STAGING_HOST_DIR)/include
	@mkdir -p $(STAGING_HOST_DIR)/$(GNU_TARGET_NAME)
	@ln -sf ../lib $(STAGING_HOST_DIR)/$(GNU_TARGET_NAME)/lib

%-download:
	$(TRACE) toolchain/$(patsubst %-download,%,$@)/download
	$(MAKE) -C $(patsubst %-download,%,$@) fetch

%-prepare: $(STAGING_HOST_DIR)
	$(TRACE) toolchain/$(patsubst %-prepare,%,$@)/prepare
	@if test x"$(patsubst %-prepare,%,$@)" = x"$(LIBC)"; then \
		$(MAKE) -C $(patsubst %-prepare,%,$@) prepare \
		    $(MAKE_TRACE); \
	else \
		$(MAKE) -C $(patsubst %-prepare,%,$@) prepare \
		    CC='$(CC_FOR_BUILD)' CFLAGS='$(CFLAGS_FOR_BUILD)' \
		    $(MAKE_TRACE); \
	fi

%-configure: %-prepare
	$(TRACE) toolchain/$(patsubst %-configure,%,$@)/configure
	@if test x"$(patsubst %-configure,%,$@)" = x"$(LIBC)"; then \
		$(MAKE) -C $(patsubst %-configure,%,$@) configure \
		    $(MAKE_TRACE); \
	else \
		$(MAKE) -C $(patsubst %-configure,%,$@) configure \
		    CC='$(CC_FOR_BUILD)' CFLAGS='$(CFLAGS_FOR_BUILD)' \
		    $(MAKE_TRACE); \
	fi

%-compile: %-configure
	$(TRACE) toolchain/$(patsubst %-compile,%,$@)/compile
	@if test x"$(patsubst %-compile,%,$@)" = x"$(LIBC)"; then \
		$(MAKE) -C $(patsubst %-compile,%,$@) compile \
		    $(MAKE_TRACE); \
	else \
		$(MAKE) -C $(patsubst %-compile,%,$@) compile \
		    CC='$(CC_FOR_BUILD)' CFLAGS='$(CFLAGS_FOR_BUILD)' \
		    $(MAKE_TRACE); \
	fi

%-install: %-compile
	$(TRACE) toolchain/$(patsubst %-install,%,$@)/install
	@if test x"$(patsubst %-install,%,$@)" = x"$(LIBC)"; then \
		$(MAKE) -C $(patsubst %-install,%,$@) install \
		    $(MAKE_TRACE); \
	else \
		$(MAKE) -C $(patsubst %-install,%,$@) install \
		    CC='$(CC_FOR_BUILD)' CFLAGS='$(CFLAGS_FOR_BUILD)' \
		    $(MAKE_TRACE); \
	fi

%-fixup: %-install
	$(TRACE) toolchain/$(patsubst %-fixup,%,$@)/fixup
	@$(MAKE) -C $(patsubst %-fixup,%,$@) fixup $(MAKE_TRACE)

%-clean:
	$(TRACE) toolchain/$(patsubst %-clean,%,$@)/clean
	@$(MAKE) -C $(patsubst %-clean,%,$@) clean $(MAKE_TRACE)
