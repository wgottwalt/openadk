# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include $(TOPDIR)/toolchain/uClibc/Makefile.inc

PKG_DESCR:=		embedded C library
PKG_SECTION:=		base
NO_DISTFILES:=		1
PKG_OPTS:=		noremove

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,UCLIBC,uclibc,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))
$(eval $(call PKG_template,UCLIBC_DEV,uclibc-dev,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

# do nothing, uClibc is already build in toolchain directory
do-install:
	${INSTALL_DIR} $(IDIR_UCLIBC)/lib $(IDIR_UCLIBC)/etc
	# create timezone file
	echo 'CET-1CEST-2,M3.5.0/02:00:00,M10.5.0/03:00:00' > $(IDIR_UCLIBC)/etc/TZ
	$(CP) $(STAGING_DIR)/lib/libgcc_s.so* $(IDIR_UCLIBC)/lib/
	$(CP) $(STAGING_DIR)/lib/libc.so* $(IDIR_UCLIBC)/lib/
	$(CP) $(STAGING_DIR)/lib/libuClibc-$(PKG_VERSION).so $(IDIR_UCLIBC)/lib/
	$(CP) $(STAGING_DIR)/lib/ld*-uClibc-$(PKG_VERSION).so $(IDIR_UCLIBC)/lib/
	$(CP) $(STAGING_DIR)/lib/ld*-uClibc.so.* $(IDIR_UCLIBC)/lib/
	-for file in libcrypt libdl libm libnsl libresolv librt libutil; do \
		$(CP) $(STAGING_DIR)/lib/$$file.so* $(IDIR_UCLIBC)/lib/; \
		$(CP) $(STAGING_DIR)/lib/$$file-$(PKG_VERSION).so $(IDIR_UCLIBC)/lib/; \
	done
	# header package
	$(MAKE) -C $(TOOLCHAIN_BUILD_DIR)/linux-$(KERNEL_VERSION) ARCH=$(ARCH) V=1 \
		INSTALL_HDR_PATH=$(IDIR_UCLIBC_DEV)/usr \
		headers_install
	$(MAKE) -C $(TOOLCHAIN_BUILD_DIR)/${PKG_NAME}-${PKG_VERSION} \
		PREFIX=$(IDIR_UCLIBC_DEV)/ \
		DEVEL_PREFIX=/usr/ \
		RUNTIME_PREFIX=$(IDIR_UCLIBC_DEV)/ \
		HOSTCC="$(HOSTCC)" \
		CPU_CFLAGS="$(TARGET_CFLAGS)" \
		install_headers
	@find $(IDIR_UCLIBC_DEV) -name .install -delete
	@find $(IDIR_UCLIBC_DEV) -name ..install.cmd -delete

include ${TOPDIR}/mk/pkg-bottom.mk
