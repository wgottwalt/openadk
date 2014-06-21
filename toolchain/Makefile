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

include $(ADK_TOPDIR)/rules.mk

TARGETS:=binutils gmp mpfr mpc libelf gcc gdb
ifeq ($(ADK_TARGET_LIB_GLIBC),y)
TARGETS+=glibc
CLIB:=glibc
endif
ifeq ($(ADK_TARGET_LIB_UCLIBC),y)
TARGETS+=uclibc
CLIB:=uclibc
endif
ifeq ($(ADK_TARGET_LIB_MUSL),y)
TARGETS+=musl
CLIB:=musl
endif

DOWNLOAD:=kernel-headers-download $(patsubst %,%-download,$(TARGETS))
TARGETS_INSTALL:=$(patsubst %,%-install,$(TARGETS))
FIXUP:=$(patsubst %,%-fixup,$(CLIB))
TARGETS_CLEAN:=$(patsubst %,%-clean,$(TARGETS))

install: $(TARGETS_INSTALL)
clean: $(TARGETS_CLEAN)
download: $(DOWNLOAD)
fixup: $(FIXUP)

gcc-prepare: binutils-install gmp-install mpfr-install mpc-install libelf-install
$(CLIB)-prepare: gcc-prepare kernel-headers-prepare
gcc-configure: $(CLIB)-prepare
$(CLIB)-compile: gcc-configure
gcc-compile: $(CLIB)-install
$(CLIB)-fixup: gcc-install gdb-install

%-download:
	$(TRACE) toolchain/$(patsubst %-download,%,$@)/download
	$(MAKE) -C $(patsubst %-download,%,$@) fetch

%-prepare:
	$(TRACE) toolchain/$(patsubst %-prepare,%,$@)/prepare
	@if test x"$(patsubst %-prepare,%,$@)" = x"$(CLIB)"; then \
		$(MAKE) -C $(patsubst %-prepare,%,$@) prepare \
		    $(MAKE_TRACE); \
	else \
		$(MAKE) -C $(patsubst %-prepare,%,$@) prepare \
		    CC='$(HOST_CC)' CFLAGS='$(HOST_CFLAGS)' $(MAKE_TRACE); \
	fi

%-configure: %-prepare
	$(TRACE) toolchain/$(patsubst %-configure,%,$@)/configure
	@if test x"$(patsubst %-configure,%,$@)" = x"$(CLIB)"; then \
		$(MAKE) -C $(patsubst %-configure,%,$@) configure \
		    $(MAKE_TRACE); \
	else \
		$(MAKE) -C $(patsubst %-configure,%,$@) configure \
		    CC='$(HOST_CC)' CFLAGS='$(HOST_CFLAGS)' $(MAKE_TRACE); \
	fi

%-compile: %-configure
	$(TRACE) toolchain/$(patsubst %-compile,%,$@)/compile
	@if test x"$(patsubst %-compile,%,$@)" = x"$(CLIB)"; then \
		$(MAKE) -C $(patsubst %-compile,%,$@) compile \
		    $(MAKE_TRACE); \
	else \
		$(MAKE) -C $(patsubst %-compile,%,$@) compile \
		    CC='$(HOST_CC)' CFLAGS='$(HOST_CFLAGS)' $(MAKE_TRACE); \
	fi

%-install: %-compile
	$(TRACE) toolchain/$(patsubst %-install,%,$@)/install
	@if test x"$(patsubst %-install,%,$@)" = x"$(CLIB)"; then \
		$(MAKE) -C $(patsubst %-install,%,$@) install \
		    $(MAKE_TRACE); \
	else \
		$(MAKE) -C $(patsubst %-install,%,$@) install \
		    CC='$(HOST_CC)' CFLAGS='$(HOST_CFLAGS)' $(MAKE_TRACE); \
	fi

%-fixup: %-install
	$(TRACE) toolchain/$(patsubst %-fixup,%,$@)/fixup
	@$(MAKE) -C $(patsubst %-fixup,%,$@) fixup $(MAKE_TRACE)

%-clean:
	$(TRACE) toolchain/$(patsubst %-clean,%,$@)/clean
	@$(MAKE) -C $(patsubst %-clean,%,$@) clean $(MAKE_TRACE)
