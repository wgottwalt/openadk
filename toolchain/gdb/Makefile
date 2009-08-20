# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include ../rules.mk
include Makefile.inc

include ${TOPDIR}/mk/buildhlp.mk

$(WRKBUILD)/.headers:
$(WRKBUILD)/.configured:
	(cd $(WRKBUILD); \
		gdb_cv_func_sigsetjmp=yes \
		./configure \
		--prefix=$(STAGING_TOOLS) \
		--build=$(GNU_HOST_NAME) \
		--host=$(GNU_HOST_NAME) \
		--target=$(REAL_GNU_TARGET_NAME) \
		--disable-dependency-tracking \
		--without-uiout \
		--enable-gdbmi \
		--disable-gdbtk \
		--without-included-gettext \
		--disable-libtool-lock \
		--disable-nls \
		--with-curses \
		--enable-threads \
		--disable-sim \
		--disable-tui \
		--disable-werror \
		--without-x \
	);
	touch $@

$(WRKBUILD)/.compiled: 
	$(MAKE) -C $(WRKBUILD) CFLAGS="-fPIC ${HOSTCFLAGS}"
	touch $@

$(WRKBUILD)/.installed: 
	install -c $(WRKBUILD)/gdb/gdb $(TARGET_CROSS)gdb
	cd $(STAGING_TOOLS)/bin && \
	ln -fs $(TARGET_CROSS)gdb $(GNU_TARGET_NAME)-gdb
	touch $@

include ${TOPDIR}/mk/toolchain.mk
