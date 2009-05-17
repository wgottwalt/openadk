# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

TARGETS:=binutils gmp mpfr gcc
ifeq ($(ADK_TARGET_LIB_GLIBC),y)
TARGETS+=glibc
LIBC:=glibc
else
TARGETS+=uClibc
LIBC:=uClibc
endif
TARGETS+=gdb

DOWNLOAD:=kernel-headers-download $(patsubst %,%-download,$(TARGETS))
TARGETS_INSTALL:=$(patsubst %,%-install,$(TARGETS))
TARGETS_CLEAN:=$(patsubst %,%-clean,$(TARGETS))

all: install
install: $(TARGETS_INSTALL)
clean: $(TARGETS_CLEAN)
download: $(DOWNLOAD)

$(LIBC)-prepare: kernel-headers-prepare
binutils-prepare: $(LIBC)-prepare
gcc-configure: binutils-install gmp-install mpfr-install
$(LIBC)-compile: gcc-configure
gcc-compile: $(LIBC)-install

$(STAGING_TOOLS):
	@mkdir -p $(STAGING_TOOLS)/lib
	@mkdir -p $(STAGING_TOOLS)/include
	@mkdir -p $(STAGING_TOOLS)/$(REAL_GNU_TARGET_NAME)
	@ln -sf ../lib $(STAGING_TOOLS)/$(REAL_GNU_TARGET_NAME)/lib

$(TOOLCHAIN_BUILD_DIR):
	@mkdir -p $(TOOLCHAIN_BUILD_DIR)

%-download:
	$(TRACE) toolchain/$(patsubst %-download,%,$@)/download
	$(MAKE) -C $(patsubst %-download,%,$@) fetch

%-prepare: $(STAGING_TOOLS) $(TOOLCHAIN_BUILD_DIR)
	$(TRACE) toolchain/$(patsubst %-prepare,%,$@)/prepare
	@if test x"$(patsubst %-prepare,%,$@)" = x"$(LIBC)"; then \
		$(MAKE) -C $(patsubst %-prepare,%,$@) prepare \
		    $(MAKE_TRACE); \
	else \
		$(MAKE) -C $(patsubst %-prepare,%,$@) prepare \
		    CC='$(HOSTCC)' CFLAGS='$(HOSTCFLAGS)' \
		    $(MAKE_TRACE); \
	fi

%-configure: %-prepare
	$(TRACE) toolchain/$(patsubst %-configure,%,$@)/configure
	@if test x"$(patsubst %-configure,%,$@)" = x"$(LIBC)"; then \
		$(MAKE) -C $(patsubst %-configure,%,$@) configure \
		    $(MAKE_TRACE); \
	else \
		$(MAKE) -C $(patsubst %-configure,%,$@) configure \
		    CC='$(HOSTCC)' CFLAGS='$(HOSTCFLAGS)' \
		    $(MAKE_TRACE); \
	fi

%-compile: %-configure
	$(TRACE) toolchain/$(patsubst %-compile,%,$@)/compile
	@if test x"$(patsubst %-compile,%,$@)" = x"$(LIBC)"; then \
		$(MAKE) -C $(patsubst %-compile,%,$@) compile \
		    $(MAKE_TRACE); \
	else \
		$(MAKE) -C $(patsubst %-compile,%,$@) compile \
		    CC='$(HOSTCC)' CFLAGS='$(HOSTCFLAGS)' \
		    $(MAKE_TRACE); \
	fi

%-install: %-compile
	$(TRACE) toolchain/$(patsubst %-install,%,$@)/install
	@if test x"$(patsubst %-install,%,$@)" = x"$(LIBC)"; then \
		$(MAKE) -C $(patsubst %-install,%,$@) install \
		    $(MAKE_TRACE); \
	else \
		$(MAKE) -C $(patsubst %-install,%,$@) install \
		    CC='$(HOSTCC)' CFLAGS='$(HOSTCFLAGS)' \
		    $(MAKE_TRACE); \
	fi

%-clean:
	$(TRACE) toolchain/$(patsubst %-clean,%,$@)/clean
	@$(MAKE) -C $(patsubst %-clean,%,$@) clean $(MAKE_TRACE)
