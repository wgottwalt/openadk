# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include $(TOPDIR)/toolchain/uClibc/Makefile.inc

PKG_DESCR:=		embedded C library
PKG_SECTION:=		base
PKG_OPTS:=		noremove

PKG_SUBPKGS:=		UCLIBC UCLIBC_DEV
PKGSD_UCLIBC_DEV:=	development files for uclibc
PKGSC_UCLIBC_DEV:=	devel

NO_DISTFILES:=		1

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,UCLIBC,uclibc,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))
$(eval $(call PKG_template,UCLIBC_DEV,uclibc-dev,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_UCLIBC_DEV},${PKGSC_UCLIBC_DEV},${PKG_OPTS}))

CONFIG_STYLE:=          manual
BUILD_STYLE:=           manual
INSTALL_STYLE:=         manual

# do nothing, uClibc is already build in toolchain directory
do-install:
	${INSTALL_DIR} $(IDIR_UCLIBC)/lib $(IDIR_UCLIBC)/etc
	# create timezone file
	test -z $(ADK_RUNTIME_TIMEZONE) || \
	    grep $(ADK_RUNTIME_TIMEZONE) ./files/tz.lst | \
	    cut -f 2 > $(IDIR_UCLIBC)/etc/TZ
ifeq ($(ADK_TOOLCHAIN_GCC_USE_SSP),y)
	$(CP) $(STAGING_TARGET_DIR)/lib/libssp.so* $(IDIR_UCLIBC)/lib
endif
	$(CP) $(STAGING_TARGET_DIR)/lib/libc.so.* $(IDIR_UCLIBC)/lib
	$(CP) $(STAGING_TARGET_DIR)/lib/libuClibc-$(PKG_VERSION).so \
		$(IDIR_UCLIBC)/lib
	$(CP) $(STAGING_TARGET_DIR)/lib/ld*-uClibc-$(PKG_VERSION).so \
		$(IDIR_UCLIBC)/lib
	$(CP) $(STAGING_TARGET_DIR)/lib/ld*-uClibc.so.* $(IDIR_UCLIBC)/lib
	-for file in libcrypt libdl libm libresolv librt libutil; do \
		$(CP) $(STAGING_TARGET_DIR)/lib/$$file.so* $(IDIR_UCLIBC)/lib; \
		$(CP) $(STAGING_TARGET_DIR)/lib/$$file-$(PKG_VERSION).so \
			$(IDIR_UCLIBC)/lib; \
	done

uclibc-dev-install:
	${INSTALL_DIR} ${IDIR_UCLIBC_DEV}/usr/lib ${IDIR_UCLIBC_DEV}/lib
	${CP} ${STAGING_TARGET_DIR}/usr/lib/libc.so ${IDIR_UCLIBC_DEV}/usr/lib
	-${CP} ${STAGING_TARGET_DIR}/usr/lib/uclibc_nonshared.a ${IDIR_UCLIBC_DEV}/usr/lib
	-${CP} ${STAGING_TARGET_DIR}/usr/lib/crt* ${IDIR_UCLIBC_DEV}/usr/lib
	-for file in libc libcrypt libdl libm libresolv librt libutil; do \
		cd $(IDIR_UCLIBC_DEV)/lib/; ln -sf $$file-$(PKG_VERSION).so $$file.so; \
	done
	$(MAKE) -C $(TOOLCHAIN_BUILD_DIR)/w-linux-$(KERNEL_VERSION)-$(KERNEL_RELEASE)/linux-$(KERNEL_VERSION) ARCH=$(ARCH) V=1 \
		INSTALL_HDR_PATH=$(IDIR_UCLIBC_DEV)/usr \
		headers_install
	$(MAKE) -C $(TOOLCHAIN_BUILD_DIR)/w-$(PKG_NAME)-$(PKG_VERSION)-$(PKG_RELEASE)/${PKG_NAME}-${PKG_VERSION} \
		PREFIX=$(IDIR_UCLIBC_DEV)/ \
		DEVEL_PREFIX=/usr/ \
		RUNTIME_PREFIX=$(IDIR_UCLIBC_DEV)/ \
		HOSTCC="$(CC_FOR_BUILD)" \
		CPU_CFLAGS="$(TARGET_CFLAGS)" \
		install_headers
	@find $(IDIR_UCLIBC_DEV) -name .install -exec rm {} \;
	@find $(IDIR_UCLIBC_DEV) -name ..install.cmd -exec rm {} \;

include ${TOPDIR}/mk/pkg-bottom.mk
