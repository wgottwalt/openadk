# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include $(TOPDIR)/toolchain/eglibc/Makefile.inc

PKG_DESCR:=		embedded GNU C library
PKG_SECTION:=		base
PKG_OPTS:=		noremove
PKG_SUBPKGS:=		EGLIBC EGLIBC_DEV

NO_DISTFILES:=		1

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,EGLIBC,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))
$(eval $(call PKG_template,EGLIBC_DEV,$(PKG_NAME)-dev,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

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
	${INSTALL_DIR} $(IDIR_EGLIBC)/lib $(IDIR_EGLIBC)/etc \
	    $(IDIR_EGLIBC)/usr/lib
	cd ${STAGING_TARGET_DIR} && for f in UTC ${ADK_RUNTIME_TIMEZONE}; do \
		test -s usr/share/zoneinfo/"$$f" || continue; \
		echo usr/share/zoneinfo/"$$f" | \
		    ${TOOLS_DIR}/cpio -pdu ${IDIR_EGLIBC}/; \
	done
	tz=; cd ${IDIR_EGLIBC}/usr/share/zoneinfo || exit 1; \
	    for f in UTC ${ADK_RUNTIME_TIMEZONE}; do \
		test -s "$$f" || continue; \
		tz=$$f; \
	done; if test x"$$tz" = x""; then \
		echo >&2 Error during timezone installation; \
		exit 1; \
	else \
		ln -sf "../usr/share/zoneinfo/$$tz" \
		    ${IDIR_EGLIBC}/etc/localtime; \
	fi
ifeq ($(ADK_TOOLCHAIN_GCC_USE_SSP),y)
	$(CP) $(STAGING_TARGET_DIR)/lib/libssp.so* $(IDIR_EGLIBC)/lib/
endif
	$(CP) $(STAGING_TARGET_DIR)/lib/ld* $(IDIR_EGLIBC)/lib/
	-for file in libc libcrypt libdl libm libresolv librt libutil libnss_dns libnss_files; do \
		$(CP) $(STAGING_TARGET_DIR)/lib/$$file.so* $(IDIR_EGLIBC)/lib/; \
		$(CP) $(STAGING_TARGET_DIR)/lib/$$file-$(PKG_VERSION).so $(IDIR_EGLIBC)/lib/; \
	done
	${INSTALL_DATA} ${STAGING_TARGET_DIR}/etc/gai.conf ${IDIR_EGLIBC}/etc/
	${INSTALL_DATA} ${STAGING_TARGET_DIR}/etc/nscd.conf ${IDIR_EGLIBC}/etc/
	${INSTALL_DATA} ${STAGING_TARGET_DIR}/etc/nsswitch.conf ${IDIR_EGLIBC}/etc/

eglibc-dev-install:
	${INSTALL_DIR} $(IDIR_EGLIBC_DEV)/lib $(IDIR_EGLIBC_DEV)/usr/lib
	# install linker script
	-cp ./files/libc.so.$(ARCH) $(IDIR_EGLIBC_DEV)/usr/lib/libc.so
	${CP} ${STAGING_TARGET_DIR}/usr/lib/crt* ${IDIR_EGLIBC_DEV}/usr/lib
	${CP} ${STAGING_TARGET_DIR}/usr/lib/libc_nonshared.a ${IDIR_EGLIBC_DEV}/usr/lib
	-for file in libc libcrypt libdl libm libresolv librt libutil; do \
		cd $(IDIR_EGLIBC_DEV)/lib/; ln -sf $$file-$(PKG_VERSION).so $$file.so; \
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
