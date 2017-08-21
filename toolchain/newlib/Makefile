# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk
include ../rules.mk
include Makefile.inc
include ${ADK_TOPDIR}/mk/buildhlp.mk

NEWLIB_CONFIGURE_ARGS:=	--enable-newlib-io-long-long \
			--enable-newlib-register-fini \
			--disable-newlib-supplied-syscalls

ifeq ($(ADK_TARGET_OS_FROSTED),y)
NEWLIB_CONFIGURE_ARGS+=	--enable-newlib-fvwrite-in-streamio=no \
			--enable-newlib-fseek-optimization=no \
			--enable-newlib_wide_orient=no \
			--enable-newlib-unbuf-stream-opt=yes
endif
	

$(WRKBUILD)/.configured:
	(cd $(WRKBUILD); \
		CC='' \
		CFLAGS='' \
		LDFLAGS='' \
		./configure --prefix=/usr \
		--target=$(GNU_TARGET_NAME) \
		--disable-nls \
		$(NEWLIB_CONFIGURE_ARGS) \
	)
	touch $@

$(WRKBUILD)/.compiled:
	PATH='$(HOST_PATH)' $(MAKE) -C $(WRKBUILD) \
		CC='' \
		CFLAGS='$(TARGET_CFLAGS)' \
		all
	touch $@

$(WRKBUILD)/.installed: $(WRKBUILD)/.compiled
	PATH='$(HOST_PATH)' $(MAKE) -C $(WRKBUILD) \
		CC='' \
		CFLAGS='$(TARGET_CFLAGS)' \
		DESTDIR=$(STAGING_TARGET_DIR) \
		install
	touch $@

include ${ADK_TOPDIR}/mk/toolchain.mk
