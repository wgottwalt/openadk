# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

TARGETS:=adk mkcrypt cpio m4 flex bc bzip2 xz

ifeq ($(ADK_HOST_NEED_GENEXT2FS),y)
TARGETS+=genext2fs
endif
ifeq ($(ADK_HOST_NEED_MKIMAGE),y)
TARGETS+=mkimage
endif
ifeq ($(ADK_HOST_NEED_MKISOFS),y)
TARGETS+=cdrtools
endif
ifeq ($(ADK_HOST_NEED_SYSLINUX),y)
TARGETS+=syslinux
endif
ifeq ($(ADK_HOST_NEED_JFFS2),y)
TARGETS+=mtd-utils
endif
ifeq ($(ADK_HOST_NEED_SQUASHFS),y)
TARGETS+=squashfs
endif
ifeq ($(ADK_HOST_NEED_LZOP),y)
TARGETS+=lzo lzop
endif
ifeq ($(ADK_HOST_NEED_LZMA),y)
TARGETS+=lzma
endif

TARGETS_INSTALL:=$(patsubst %,%-install,$(TARGETS))
TARGETS_CLEAN:=$(patsubst %,%-clean,$(TARGETS))

all: install
compile:
install: $(TARGETS_INSTALL)
clean: $(TARGETS_CLEAN)

%-compile: $(TOOLS_BUILD_DIR)
	$(TRACE) "tools/$(patsubst %-compile,%,$@)/compile "
	$(MAKE) -C $(patsubst %-compile,%,$@) compile $(MAKE_TRACE)

%-install:
	$(TRACE) "tools/$(patsubst %-install,%,$@)/install "
	$(MAKE) -C $(patsubst %-install,%,$@) install $(MAKE_TRACE)

%-clean:
	$(TRACE) "tools/$(patsubst %-clean,%,$@)/clean "
	$(MAKE) -C $(patsubst %-clean,%,$@) clean
