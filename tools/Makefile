# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

TARGETS:=mkcrypt cpio
TARGETS_INSTALL:=$(patsubst %,%-install,$(TARGETS))
TARGETS_CLEAN:=$(patsubst %,%-clean,$(TARGETS))

all: install
compile:
install: $(TARGETS_INSTALL)
clean: $(TARGETS_CLEAN)

$(TOOLS_BUILD_DIR):
	mkdir -p $(TOOLS_BUILD_DIR)

%-download:
	$(TRACE) "tools/$(patsubst %-download,%,$@)/download "
	$(MAKE) -C $(patsubst %-download,%,$@) fetch

%-compile: $(TOOLS_BUILD_DIR)
	$(TRACE) "tools/$(patsubst %-compile,%,$@)/compile "
	$(MAKE) -C $(patsubst %-compile,%,$@) compile

%-install:
	$(TRACE) "tools/$(patsubst %-install,%,$@)/install "
	$(MAKE) -C $(patsubst %-install,%,$@) install

%-clean:
	$(TRACE) "tools/$(patsubst %-clean,%,$@)/clean "
	$(MAKE) -C $(patsubst %-clean,%,$@) clean
