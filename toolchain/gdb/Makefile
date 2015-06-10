# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk
include ../rules.mk
include Makefile.inc
include ${ADK_TOPDIR}/mk/buildhlp.mk

ifeq (${ADK_MAKE_PARALLEL},y)
GDB_MAKEOPTS+=		-j${ADK_MAKE_JOBS}
endif
ifeq ($(ADK_TARGET_SIM),y)
CONFIGURE_ARGS:=	--enable-sim
else
CONFIGURE_ARGS:=	--disable-sim
endif

ifeq ($(ADK_TARGET_SIM),y)
CONFIGURE_ARGS:=	--enable-sim
else
CONFIGURE_ARGS:= 	--disable-sim
endif

$(WRKBUILD)/.headers:
$(WRKBUILD)/.configured:
	$(SED) 's/install_to_$(INSTALL_DEST) //' ${WRKBUILD}/libiberty/Makefile.in
	(cd $(WRKBUILD); \
		gdb_cv_func_sigsetjmp=yes \
		./configure \
		--prefix=$(STAGING_HOST_DIR) \
		--build=$(GNU_HOST_NAME) \
		--host=$(GNU_HOST_NAME) \
		--target=$(GNU_TARGET_NAME) \
		--disable-dependency-tracking \
		--without-uiout \
		--enable-gdbmi \
		--disable-gdbtk \
		--without-included-gettext \
		--disable-libtool-lock \
		--disable-nls \
		--with-curses \
		--enable-threads \
		--disable-tui \
		--disable-werror \
		--disable-install-libiberty \
		--without-python \
		--without-x \
		$(CONFIGURE_ARGS) \
	);
	touch $@

$(WRKBUILD)/.compiled:
	$(MAKE) ${GDB_MAKEOPTS} -C $(WRKBUILD) CFLAGS="-fPIC ${CFLAGS_FOR_BUILD}"
	touch $@

$(WRKBUILD)/.installed:
	$(INSTALL_BIN) $(WRKBUILD)/gdb/gdb $(TARGET_CROSS)gdb
ifeq ($(ADK_TARGET_ARCH_BFIN),y)
	$(INSTALL_BIN) $(WRKBUILD)/sim/bfin/run $(TARGET_CROSS)run
endif
ifeq ($(ADK_TARGET_ARCH_H8300),y)
	$(INSTALL_BIN) $(WRKBUILD)/sim/h8300/run $(TARGET_CROSS)run
endif
	touch $@

include ${ADK_TOPDIR}/mk/toolchain.mk
