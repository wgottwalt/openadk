# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

# Main makefile for the packages

include $(TOPDIR)/rules.mk

ifeq (${ADK_TARGET_LIB_GLIBC},y)
package-$(ADK_PACKAGE_GLIBC) += glibc
gcc-compile: glibc-compile
endif

ifeq (${ADK_TARGET_LIB_MUSL},y)
package-$(ADK_PACKAGE_MUSL) += musl
gcc-compile: musl-compile
endif

ifeq (${ADK_TARGET_LIB_UCLIBC},y)
package-$(ADK_PACKAGE_UCLIBC) += uclibc
package-$(ADK_PACKAGE_UCLIBCXX) += uclibc++
gcc-compile: uclibc-compile
endif

package-$(ADK_PACKAGE_LIBPTHREAD) += libpthread

include $(TOPDIR)/package/Depends.mk

DOWNLOAD:=$(patsubst %,%-download,$(package-y) $(package-m))
REBUILD_PACKAGES:=$(patsubst %,%-rebuild,$(package-y) $(package-m))
COMPILE_PACKAGES:=$(patsubst %,%-compile,$(package-y) $(package-m))
HOST_COMPILE_PACKAGES:=$(patsubst %,%-host-compile,$(hostpackage-y))
INSTALL_PACKAGES:=$(patsubst %,%-install,$(package-y))

all: compile
download: $(DOWNLOAD)
clean: $(patsubst %,%-clean,$(package-) $(package-y) $(package-m) base-files)
hostcompile: $(HOST_COMPILE_PACKAGES)
ifeq ($(ADK_TOOLCHAIN_ONLY),y)
compile: $(REBUILD_PACKAGES) $(COMPILE_PACKAGES)
install: $(INSTALL_PACKAGES)
else
compile: $(REBUILD_PACKAGES) base-files-compile $(COMPILE_PACKAGES)
install: base-files-install $(INSTALL_PACKAGES)
endif

%-download:
	$(START_TRACE) "package/$(patsubst %-download,%,$@)-download: "
	$(MAKE) -C $(patsubst %-download,%,$@) fetch
	$(CMD_TRACE) " done"
	$(END_TRACE)

%-host-compile:
	$(START_TRACE) "package/$(patsubst %-host-compile,%,$@)-host-compile: "
	$(MAKE) -C $(patsubst %-host-compile,%,$@) hostpackage
	$(CMD_TRACE) " done"
	$(END_TRACE)

%-compile:
	$(START_TRACE) "package/$(patsubst %-compile,%,$@)-compile: "
	$(MAKE) -C $(patsubst %-compile,%,$@) fake build-all-pkgs
	$(CMD_TRACE) " done"
	$(END_TRACE)

%-rebuild:
	$(START_TRACE) "package/$(patsubst %-rebuild,%,$@)-rebuild: "
	$(MAKE) -C $(patsubst %-rebuild,%,$@) rebuild
	$(CMD_TRACE) " done"
	$(END_TRACE)

%-install:
	$(START_TRACE) "package/$(patsubst %-install,%,$@)-install: "
	$(MAKE) -C $(patsubst %-install,%,$@) install
	$(CMD_TRACE) " done"
	$(END_TRACE)

%-clean:
	$(START_TRACE) "package/$(patsubst %-clean,%,$@)-clean: "
	$(MAKE) -C $(patsubst %-clean,%,$@) clean
	$(CMD_TRACE) " done"
	$(END_TRACE)
