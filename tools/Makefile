# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

TARGETS:=adk mkcrypt cpio mkimage genext2fs cdrtools syslinux

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
