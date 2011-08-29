# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

TARGETS:=
ifneq ($(ADK_PACKAGE_OPENJDK),)
# jikes is for ant
TARGETS+=fastjar gcj ecj jikes classpath jamvm ant openjdk qemu
endif

TARGETS_INSTALL:=$(patsubst %,%-install,$(TARGETS))
TARGETS_CLEAN:=$(patsubst %,%-clean,$(TARGETS))

all: install
compile:
install: $(TARGETS_INSTALL)
clean: $(TARGETS_CLEAN)

%-compile: $(TOOLS_BUILD_DIR)
	$(TRACE) "jtools/$(patsubst %-compile,%,$@)/compile "
	$(MAKE) -C $(patsubst %-compile,%,$@) compile

%-install:
	$(TRACE) "jtools/$(patsubst %-install,%,$@)/install "
	$(MAKE) -C $(patsubst %-install,%,$@) install

%-clean:
	$(TRACE) "jtools/$(patsubst %-clean,%,$@)/clean "
	$(MAKE) -C $(patsubst %-clean,%,$@) clean
