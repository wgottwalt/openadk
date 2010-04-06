# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include $(TOPDIR)/toolchain/glibc/Makefile.inc

PKG_DESCR:=		GNU C library
PKG_SECTION:=		base
NO_DISTFILES:=		1
PKG_OPTS:=		noremove

include $(TOPDIR)/mk/package.mk

GLIBC_CONFOPTS:=          \
			--build=$(GNU_HOST_NAME) \
			--host=$(REAL_GNU_TARGET_NAME) \
			--with-headers=$(TOOLCHAIN_SYSROOT)/usr/include \
			--disable-nls \
			--disable-sanity-checks \
			--disable-nls \
			--without-cvs \
			--disable-profile \
			--disable-debug \
			--without-gd \
			--with-__thread \
			--with-tls \
			--enable-kernel="2.6.0" \
			--enable-add-ons

$(eval $(call PKG_template,GLIBC,glibc,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))
$(eval $(call PKG_template,GLIBC_DEV,glibc-dev,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

SUB_INSTALLS-y:=
SUB_INSTALLS-m:=
SUB_INSTALLS-${ADK_PACKAGE_GLIBC_DEV}+=		glibc-dev-install

# compile nothing, glibc is already build in toolchain directory
do-install: ${SUB_INSTALLS-m} ${SUB_INSTALLS-y}
	${INSTALL_DIR} $(IDIR_GLIBC)/lib $(IDIR_GLIBC)/etc
	# install /etc/localtime from host system (FIXME)
	${CP} /etc/localtime $(IDIR_GLIBC)/etc
	$(CP) $(STAGING_DIR)/lib/libgcc_s.so* $(IDIR_GLIBC)/lib/
	$(CP) $(STAGING_DIR)/lib/ld*.so* $(IDIR_GLIBC)/lib/
	-for file in libc libcrypt libdl libm libnsl libresolv librt libutil libnss_compat libnss_dns libnss_files; do \
		$(CP) $(STAGING_DIR)/lib/$$file.so* $(IDIR_GLIBC)/lib/; \
		$(CP) $(STAGING_DIR)/lib/$$file-$(PKG_VERSION).so $(IDIR_GLIBC)/lib/; \
	done

glibc-dev-install:
	${INSTALL_DIR} $(IDIR_GLIBC_DEV)/lib $(IDIR_GLIBC_DEV)/usr/lib
	# install linker script
	-cp ./files/libc.so.$(ARCH) $(IDIR_GLIBC_DEV)/usr/lib/libc.so
	${CP} ${STAGING_DIR}/usr/lib/crt* ${IDIR_GLIBC_DEV}/usr/lib
	${CP} ${STAGING_DIR}/usr/lib/libc_nonshared.a ${IDIR_GLIBC_DEV}/usr/lib
	# header package
	$(MAKE) -C $(TOOLCHAIN_BUILD_DIR)/w-linux-$(KERNEL_VERSION)-$(KERNEL_RELEASE)/linux-$(KERNEL_VERSION) \
		HOSTCC=$(HOSTCC) ARCH=$(ARCH) V=1 \
		INSTALL_HDR_PATH=$(IDIR_GLIBC_DEV)/usr \
		headers_install
	(cd $(WRKBUILD); \
		$(TOOLCHAIN_BUILD_DIR)/w-$(PKG_NAME)-$(PKG_VERSION)-$(PKG_RELEASE)/$(PKG_NAME)-$(PKG_VERSION)/configure \
		--prefix=/usr \
		--with-sysroot=$(IDIR_GLIBC_DEV) \
		${GLIBC_CONFOPTS} \
	);
	$(MAKE) -C $(WRKBUILD) \
		cross-compiling=yes \
		install_root=$(IDIR_GLIBC_DEV) \
		install-headers
	touch $(IDIR_GLIBC_DEV)/usr/include/gnu/stubs.h
	touch $(IDIR_GLIBC_DEV)/usr/include/bits/stdio_lim.h
	@find $(IDIR_GLIBC_DEV) -name .install -exec rm {} \;

include ${TOPDIR}/mk/pkg-bottom.mk
