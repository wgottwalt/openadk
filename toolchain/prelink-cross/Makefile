# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk
include ../rules.mk
include Makefile.inc
include ${ADK_TOPDIR}/mk/buildhlp.mk

$(WRKBUILD)/.headers:
$(WRKBUILD)/.configured:
	(cd $(WRKBUILD)/trunk; \
		./configure \
		--prefix=$(STAGING_HOST_DIR) \
		--build=$(GNU_HOST_NAME) \
		--host=$(GNU_HOST_NAME) \
		--target=$(REAL_GNU_TARGET_NAME) \
		--disable-dependency-tracking \
		--disable-libtool-lock \
		--with-gnu-ld \
	);
	touch $@

$(WRKBUILD)/.compiled:
	$(MAKE) -C $(WRKBUILD)/trunk CFLAGS="-fPIC ${CFLAGS_FOR_BUILD}"
	touch $@

$(WRKBUILD)/.installed:
	install -c ${WRKBUILD}/trunk/src/prelink \
		${TARGET_CROSS}prelink
	install -c ${WRKBUILD}/trunk/src/prelink-rtld \
		${TARGET_CROSS}prelink-rtld
	touch $@

include ${ADK_TOPDIR}/mk/toolchain.mk
