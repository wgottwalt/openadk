# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include $(TOPDIR)/toolchain/eglibc/Makefile.inc

PKG_DESCR:=		embedded GNU C library
PKG_SECTION:=		base
PKG_OPTS:=		noremove
PKG_SUBPKGS:=		EGLIBC EGLIBC_DEV EGLIBC_STATIC

NO_DISTFILES:=		1

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,EGLIBC,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))
$(eval $(call PKG_template,EGLIBC_DEV,$(PKG_NAME)-dev,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))
$(eval $(call PKG_template,EGLIBC_STATIC,$(PKG_NAME)-static,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

# compile nothing, eglibc is already build in toolchain directory
do-install:
	${INSTALL_DIR} $(IDIR_EGLIBC)/$(ADK_TARGET_LIBC_PATH) \
	    $(IDIR_EGLIBC)/usr/lib $(IDIR_EGLIBC)/usr/bin
	$(CP) $(STAGING_TARGET_DIR)/lib/ld* $(IDIR_EGLIBC)/$(ADK_TARGET_LIBC_PATH)
	-for file in libc libcrypt libdl libm libresolv libutil libnsl libnss_dns libnss_files; do \
		$(CP) $(STAGING_TARGET_DIR)/lib/$$file.so* $(IDIR_EGLIBC)/$(ADK_TARGET_LIBC_PATH); \
		$(CP) $(STAGING_TARGET_DIR)/lib/$$file-$(PKG_VERSION).so $(IDIR_EGLIBC)/$(ADK_TARGET_LIBC_PATH); \
	done
	$(CP) $(STAGING_TARGET_DIR)/usr/bin/getconf $(IDIR_EGLIBC)/usr/bin
	${INSTALL_DIR} $(IDIR_EGLIBC)/etc 
	${INSTALL_DATA} ${STAGING_TARGET_DIR}/etc/gai.conf ${IDIR_EGLIBC}/etc
	${INSTALL_DATA} ./files/nsswitch.conf ${IDIR_EGLIBC}/etc

eglibc-static-install:
	${INSTALL_DIR} $(IDIR_EGLIBC_STATIC)/usr/lib
	$(CP) $(STAGING_TARGET_DIR)/usr/lib/libc.a $(IDIR_EGLIBC_STATIC)/usr/lib

eglibc-dev-install:
	${INSTALL_DIR} $(IDIR_EGLIBC_DEV)/$(ADK_TARGET_LIBC_PATH) $(IDIR_EGLIBC_DEV)/usr/lib
	# install linker script
	cp ./files/libc.so.$(CPU_ARCH) $(IDIR_EGLIBC_DEV)/usr/lib/libc.so
ifeq ($(ADK_TARGET_ABI_O32),y)
ifeq ($(ADK_big),y)
	$(SED) "s#@@ELFTARGET@@#elf32-tradbigmips#" $(IDIR_EGLIBC_DEV)/usr/lib/libc.so
else
	$(SED) "s#@@ELFTARGET@@#elf32-tradlittlemips#" $(IDIR_EGLIBC_DEV)/usr/lib/libc.so
endif
endif
ifeq ($(ADK_TARGET_ABI_N32),y)
ifeq ($(ADK_big),y)
	$(SED) "s#@@ELFTARGET@@#elf32-ntradbigmips#" $(IDIR_EGLIBC_DEV)/usr/lib/libc.so
else
	$(SED) "s#@@ELFTARGET@@#elf32-ntradlittlemips#" $(IDIR_EGLIBC_DEV)/usr/lib/libc.so
endif
endif
ifeq ($(ADK_TARGET_ABI_N64),y)
ifeq ($(ADK_big),y)
	$(SED) "s#@@ELFTARGET@@#elf64-tradbigmips#" $(IDIR_EGLIBC_DEV)/usr/lib/libc.so
else
	$(SED) "s#@@ELFTARGET@@#elf64-tradlittlemips#" $(IDIR_EGLIBC_DEV)/usr/lib/libc.so
endif
endif
	${CP} ${STAGING_TARGET_DIR}/usr/lib/crt* ${IDIR_EGLIBC_DEV}/usr/lib
	${CP} ${STAGING_TARGET_DIR}/usr/lib/libc_nonshared.a ${IDIR_EGLIBC_DEV}/usr/lib
	-for file in libcrypt libdl libm libresolv libutil libnsl; do \
		cd $(IDIR_EGLIBC_DEV)/$(ADK_TARGET_LIBC_PATH)/; ln -sf $$file-$(PKG_VERSION).so $$file.so; \
	done
	# header package
	$(MAKE) -C $(TOOLCHAIN_BUILD_DIR)/w-linux-$(KERNEL_VERSION)-$(KERNEL_RELEASE)/linux-$(KERNEL_VERSION) \
		HOSTCC=$(CC_FOR_BUILD) ARCH=$(ARCH) V=1 \
		INSTALL_HDR_PATH=$(IDIR_EGLIBC_DEV)/usr \
		headers_install
	(cd $(WRKBUILD); \
		${EGLIBC_ENV} \
		$(TOOLCHAIN_BUILD_DIR)/w-$(PKG_NAME)-$(PKG_VERSION)-$(PKG_RELEASE)/$(PKG_NAME)-$(PKG_VERSION)/libc/configure \
			--host=$(GNU_TARGET_NAME) \
			--prefix=$(IDIR_EGLIBC_DEV)/usr \
			--with-headers=$(IDIR_EGLIBC_DEV)/usr/include \
			${EGLIBC_CONFOPTS} \
	);
	PATH='${TARGET_PATH}' $(MAKE) -C $(WRKBUILD) install-headers install-bootstrap-headers=yes
	touch $(IDIR_EGLIBC_DEV)/usr/include/gnu/stubs.h
	touch $(IDIR_EGLIBC_DEV)/usr/include/gnu/stubs-{32,x32,64}.h
	@find $(IDIR_EGLIBC_DEV) -name .install -exec rm {} \;
	@find $(IDIR_EGLIBC_DEV) -name ..install.cmd -exec rm {} \;
	# conflicts with libiconv
	find $(IDIR_EGLIBC_DEV) -name iconv.h -exec rm {} \;

include ${TOPDIR}/mk/pkg-bottom.mk
