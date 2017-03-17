# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk
include ../rules.mk
include Makefile.inc

include ${ADK_TOPDIR}/mk/buildhlp.mk

BUILD_DIR_INITIAL:=	$(WRKBUILD)-initial
BUILD_DIR_FINAL:=	$(WRKBUILD)-final

LLVM_VERSION:=4.0.0

ifeq ($(ADK_TARGET_ARCH_ARM),y)
LLVM_TARGETS:=ARM
ifeq ($(ADK_TARGET_SOFT_FLOAT),y)
LLVM_TRIPLE:=arm-linux-eabi
endif
ifeq ($(ADK_TARGET_HARD_FLOAT),y)
LLVM_TRIPLE:=arm-linux-eabihf
endif
endif

$(BUILD_DIR_INITIAL)/.configured:
	(cd $(DL_DIR); \
		for file in cfe lld compiler-rt libcxx libcxxabi; do \
			if [ ! -f $${file}-$(LLVM_VERSION).src.tar.xz ]; then \
				wget http://llvm.org/releases/$(LLVM_VERSION)/$${file}-$(LLVM_VERSION).src.tar.xz ; \
			fi; \
		done; \
	) 
	(cd $(WRKBUILD)/tools && tar xvf $(DL_DIR)/cfe-$(LLVM_VERSION).src.tar.xz && mv cfe-$(LLVM_VERSION).src clang)
	(cd $(WRKBUILD)/tools && tar xvf $(DL_DIR)/lld-$(LLVM_VERSION).src.tar.xz && mv lld-$(LLVM_VERSION).src lld)
	(cd $(WRKBUILD)/projects && tar xvf $(DL_DIR)/compiler-rt-$(LLVM_VERSION).src.tar.xz && mv compiler-rt-$(LLVM_VERSION).src compiler-rt)
	(cd $(WRKBUILD)/projects && tar xvf $(DL_DIR)/libcxx-$(LLVM_VERSION).src.tar.xz && mv libcxx-$(LLVM_VERSION).src libcxx)
	(cd $(WRKBUILD)/projects && tar xvf $(DL_DIR)/libcxxabi-$(LLVM_VERSION).src.tar.xz && mv libcxxabi-$(LLVM_VERSION).src libcxxabi)
	mkdir -p $(BUILD_DIR_INITIAL)
	cd $(BUILD_DIR_INITIAL); \
		PATH='$(HOST_PATH)' \
		cmake -DCMAKE_BUILD_TYPE=Release \
			-DCMAKE_INSTALL_PREFIX=$(TOOLCHAIN_DIR)/usr \
			-DCMAKE_CXX_FLAGS="-std=c++11" \
			-DLLVM_ENABLE_EH=ON \
			-DLLVM_ENABLE_RTTI=ON \
			-DLLVM_DEFAULT_TARGET_TRIPLE=$(LLVM_TRIPLE) \
			-DLLVM_TARGETS_TO_BUILD=$(LLVM_TARGETS) \
			$(WRKBUILD)
	touch $@

$(BUILD_DIR_INITIAL)/.compiled: $(BUILD_DIR_INITIAL)/.configured
	PATH='$(TARGET_PATH)' \
		$(MAKE) -j$(ADK_MAKE_JOBS) -C $(BUILD_DIR_INITIAL) all
	touch $@

$(WRKBUILD)/.configured: $(BUILD_DIR_INITIAL)/.compiled
	PATH='$(TARGET_PATH)' \
		$(MAKE) -j$(ADK_MAKE_JOBS) -C $(BUILD_DIR_INITIAL) install
	touch $@

$(WRKBUILD)/.compiled:
	touch $@

$(WRKBUILD)/.installed: $(WRKBUILD)/.compiled
	touch $@

$(WRKBUILD)/.final:
	touch $@

include ${ADK_TOPDIR}/mk/toolchain.mk
