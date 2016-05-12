# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk
include ../rules.mk
include Makefile.inc

include ${ADK_TOPDIR}/mk/buildhlp.mk

BUILD_DIR_INITIAL:=	$(WRKBUILD)-initial
BUILD_DIR_FINAL:=	$(WRKBUILD)-final

LLVM_TARGETS:=ARM

$(BUILD_DIR_INITIAL)/.configured:
	(cd $(DL_DIR) && wget http://llvm.org/releases/3.8.0/cfe-3.8.0.src.tar.xz)
	(cd $(DL_DIR) && wget http://llvm.org/releases/3.8.0/compiler-rt-3.8.0.src.tar.xz)
	(cd $(WRKBUILD)/tools && tar xvf $(DL_DIR)/cfe-3.8.0.src.tar.xz && mv cfe-3.8.0.src clang)
	(cd $(WRKBUILD)/projects && tar xvf $(DL_DIR)/compiler-rt-3.8.0.src.tar.xz && mv compiler-rt-3.8.0.src compiler-rt)
	mkdir -p $(BUILD_DIR_INITIAL)
	cd $(BUILD_DIR_INITIAL); \
		PATH='$(HOST_PATH)' \
		cmake -DCMAKE_BUILD_TYPE=Release \
			-DCMAKE_INSTALL_PREFIX=$(TOOLCHAIN_DIR)/usr \
			-DLLVM_DEFAULT_TARGET_TRIPLE="arm-none-eabi" \
			-DCMAKE_CXX_FLAGS="-std=c++11" \
			-DLLVM_TARGETS_TO_BUILD=$(LLVM_TARGETS) \
			$(WRKBUILD)
	touch $@

$(BUILD_DIR_INITIAL)/.compiled: $(BUILD_DIR_INITIAL)/.configured
	PATH='$(TARGET_PATH)' \
		$(MAKE) -C $(BUILD_DIR_INITIAL) all
	touch $@

$(WRKBUILD)/.configured: $(BUILD_DIR_INITIAL)/.compiled
	PATH='$(TARGET_PATH)' \
		$(MAKE) -C $(BUILD_DIR_INITIAL) install
	touch $@

$(WRKBUILD)/.compiled:
	touch $@

$(WRKBUILD)/.installed: $(WRKBUILD)/.compiled
	touch $@

$(WRKBUILD)/.final:
	touch $@

include ${ADK_TOPDIR}/mk/toolchain.mk
