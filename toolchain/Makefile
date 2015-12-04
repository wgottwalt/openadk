# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

# Steps to build toolchains
# 1) build and install binutils
# 2) build and install mpfr, mpc, libelf and gmp
# 3) build and install initial gcc
# 4) install kernel-headers
# 5) build and install full libc
# 6) build and install full gcc
# 7) build and install gdb debugger

include $(ADK_TOPDIR)/rules.mk

TARGETS:=binutils gmp mpfr mpc libelf gcc

ifeq ($(ADK_TARGET_LIB_GLIBC),y)
TARGETS+=glibc
CLIB:=glibc
endif
ifeq ($(ADK_TARGET_LIB_UCLIBC_NG),y)
TARGETS+=uclibc-ng
CLIB:=uclibc-ng
endif
ifeq ($(ADK_TARGET_LIB_MUSL),y)
TARGETS+=musl
CLIB:=musl
endif
ifeq ($(ADK_TARGET_LIB_NEWLIB),y)
TARGETS+=newlib
CLIB:=newlib
endif

ifeq ($(ADK_TARGET_BINFMT_FLAT),y)
TARGETS+=elf2flt
ELF2FLT:=elf2flt-install
endif

# disable gdb for some architectures
ifeq ($(ADK_TARGET_ARCH_ARC)$(ADK_TARGET_ARCH_METAG)$(ADK_TARGET_ARCH_OR1K),)
TARGETS+=gdb
GDB:=gdb-install
endif
ifeq (${ADK_PRELINK},y)
TARGETS+=prelink-cross
endif

DOWNLOAD:=kernel-headers-download $(patsubst %,%-download,$(TARGETS))
TARGETS_INSTALL:=$(patsubst %,%-install,$(TARGETS))
FINAL:=$(patsubst %,%-final,gcc)
TARGETS_CLEAN:=$(patsubst %,%-clean,$(TARGETS))

install: $(TARGETS_INSTALL)
clean: $(TARGETS_CLEAN)
download: $(DOWNLOAD)
final: $(FINAL)

gcc-configure: binutils-install gmp-install mpfr-install mpc-install libelf-install
$(CLIB)-install: gcc-configure kernel-headers-configure
gcc-install: $(ELF2FLT) $(CLIB)-install
gcc-final: gcc-install $(GDB)

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
		    CC='$(HOST_CC)' CFLAGS='$(HOST_CFLAGS)' CXXFLAGS='$(HOST_STATIC_CXXFLAGS)' $(MAKE_TRACE); \
	fi

%-install: %-compile
	$(TRACE) toolchain/$(patsubst %-install,%,$@)/install
	@if test x"$(patsubst %-install,%,$@)" = x"$(CLIB)"; then \
		$(MAKE) -C $(patsubst %-install,%,$@) install \
		    $(MAKE_TRACE); \
	else \
		$(MAKE) -C $(patsubst %-install,%,$@) install \
		    CC='$(HOST_CC)' CFLAGS='$(HOST_CFLAGS)' CXXFLAGS='$(HOST_STATIC_CXXFLAGS)' $(MAKE_TRACE); \
	fi

%-final: %-install
	$(TRACE) toolchain/$(patsubst %-final,%,$@)/final
	@$(MAKE) -C $(patsubst %-final,%,$@) final $(MAKE_TRACE)

%-clean:
	$(TRACE) toolchain/$(patsubst %-clean,%,$@)/clean
	@$(MAKE) -C $(patsubst %-clean,%,$@) clean $(MAKE_TRACE)
