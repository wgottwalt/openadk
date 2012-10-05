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

EGLIBC_CONFOPTS:=	--build=$(GNU_HOST_NAME) \
			--host=$(REAL_GNU_TARGET_NAME) \
			--with-headers=$(STAGING_TARGET_DIR)/usr/include \
			--disable-nls \
			--without-cvs \
			--disable-profile \
			--disable-debug \
			--enable-kernel=2.6.0 \
			--without-gd \
			--with-__thread \
			--with-tls \
			--enable-add-ons

EGLIBC_ENV:=		PATH='${TARGET_PATH}' \
			GCC_HONOUR_COPTS=s \
			BUILD_CC=${CC_FOR_BUILD} \
			CFLAGS="$(TARGET_CFLAGS)" \
			CC=${REAL_GNU_TARGET_NAME}-gcc \
			CXX=${REAL_GNU_TARGET_NAME}-g++ \
			AR=${REAL_GNU_TARGET_NAME}-ar \
			RANLIB=${REAL_GNU_TARGET_NAME}-ranlib \
			libc_cv_forced_unwind=yes \
			libc_cv_c_cleanup=yes \
			libc_cv_gnu99_inline=yes \
			libc_cv_slibdir="/lib"

# compile nothing, eglibc is already build in toolchain directory
do-install:
ifeq ($(ADK_LOCALES),y)
	${INSTALL_DIR} $(IDIR_EGLIBC)/usr/bin
	$(CP) $(STAGING_TARGET_DIR)/usr/bin/locale $(IDIR_EGLIBC)/usr/bin
endif
	${INSTALL_DIR} $(IDIR_EGLIBC)/$(ADK_TARGET_LIBC_PATH) $(IDIR_EGLIBC)/etc \
	    $(IDIR_EGLIBC)/usr/lib $(IDIR_EGLIBC)/usr/bin
ifeq ($(ADK_TOOLCHAIN_GCC_USE_SSP),y)
	$(CP) $(STAGING_TARGET_DIR)/lib/libssp.so* $(IDIR_EGLIBC)/$(ADK_TARGET_LIBC_PATH)
endif
	$(CP) $(STAGING_TARGET_DIR)/lib/ld* $(IDIR_EGLIBC)/$(ADK_TARGET_LIBC_PATH)
	-for file in libc libcrypt libdl libm libresolv libutil libnsl libnss_dns libnss_files; do \
		$(CP) $(STAGING_TARGET_DIR)/lib/$$file.so* $(IDIR_EGLIBC)/$(ADK_TARGET_LIBC_PATH); \
		$(CP) $(STAGING_TARGET_DIR)/lib/$$file-$(PKG_VERSION).so $(IDIR_EGLIBC)/$(ADK_TARGET_LIBC_PATH); \
	done
	${INSTALL_DATA} ${STAGING_TARGET_DIR}/etc/gai.conf ${IDIR_EGLIBC}/etc
	${INSTALL_DATA} ${STAGING_TARGET_DIR}/etc/nscd.conf ${IDIR_EGLIBC}/etc
	${INSTALL_DATA} ${STAGING_TARGET_DIR}/etc/nsswitch.conf ${IDIR_EGLIBC}/etc
	$(CP) $(STAGING_TARGET_DIR)/usr/bin/getconf $(IDIR_EGLIBC)/usr/bin

eglibc-static-install:
	${INSTALL_DIR} $(IDIR_EGLIBC_STATIC)/usr/lib
	$(CP) $(STAGING_TARGET_DIR)/usr/lib/libc.a $(IDIR_EGLIBC_STATIC)/usr/lib

eglibc-dev-install:
	${INSTALL_DIR} $(IDIR_EGLIBC_DEV)/$(ADK_TARGET_LIBC_PATH) $(IDIR_EGLIBC_DEV)/usr/lib
	# install linker script
	-cp ./files/libc.so.$(CPU_ARCH) $(IDIR_EGLIBC_DEV)/usr/lib/libc.so
ifeq ($(ADK_TARGET_ABI_O32),y)
	$(SED) "s#@@ELFFORMAT@@#elf32-tradlittlemips#" $(IDIR_EGLIBC_DEV)/usr/lib/libc.so
endif
ifeq ($(ADK_TARGET_ABI_N32),y)
	$(SED) "s#@@ELFFORMAT@@#elf32-ntradlittlemips#" $(IDIR_EGLIBC_DEV)/usr/lib/libc.so
endif
ifeq ($(ADK_TARGET_ABI_N64),y)
	$(SED) "s#@@ELFFORMAT@@#elf64-tradlittlemips#" $(IDIR_EGLIBC_DEV)/usr/lib/libc.so
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
			--prefix=$(IDIR_EGLIBC_DEV)/usr \
			--with-headers=$(IDIR_EGLIBC_DEV)/usr/include \
			${EGLIBC_CONFOPTS} \
	);
	PATH='${TARGET_PATH}' $(MAKE) -C $(WRKBUILD) \
		install-headers install-bootstrap-headers=yes
	@touch $(IDIR_EGLIBC_DEV)/usr/include/gnu/stubs.h
	@find $(IDIR_EGLIBC_DEV) -name .install -exec rm {} \;
	@find $(IDIR_EGLIBC_DEV) -name ..install.cmd -exec rm {} \;
	# conflicts with libiconv
	find $(IDIR_EGLIBC_DEV) -name iconv.h -exec rm {} \;

include ${TOPDIR}/mk/pkg-bottom.mk
