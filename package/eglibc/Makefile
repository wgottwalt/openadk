# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include $(TOPDIR)/toolchain/eglibc/Makefile.inc

PKG_DESCR:=		embedded GNU C library
PKG_SECTION:=		base
NO_DISTFILES:=		1
PKG_OPTS:=		noremove

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,EGLIBC,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))
$(eval $(call PKG_template,EGLIBC_DEV,$(PKG_NAME)-dev,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

SUB_INSTALLS-y:=
SUB_INSTALLS-m:=
SUB_INSTALLS-${ADK_PACKAGE_EGLIBC_DEV}+=	eglibc-dev-install

EGLIBC_CONFOPTS:=	\
			--build=$(GNU_HOST_NAME) \
			--host=$(REAL_GNU_TARGET_NAME) \
			--with-headers=$(TOOLCHAIN_SYSROOT)/usr/include \
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
			BUILD_CC=${HOSTCC} \
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
do-install: ${SUB_INSTALLS-m} ${SUB_INSTALLS-y}
	${INSTALL_DIR} $(IDIR_EGLIBC)/lib $(IDIR_EGLIBC)/etc $(IDIR_EGLIBC)/usr/lib
	# install /etc/localtime from host system (FIXME)
	${CP} /etc/localtime $(IDIR_EGLIBC)/etc
	$(CP) $(STAGING_DIR)/lib/ld-* $(IDIR_EGLIBC)/lib/
	$(CP) $(STAGING_DIR)/lib/libgcc_s.so* $(IDIR_EGLIBC)/lib/
	-for file in libc libcrypt libdl libm libnsl libresolv librt libutil libnss_compat libnss_dns libnss_files; do \
		$(CP) $(STAGING_DIR)/lib/$$file.so* $(IDIR_EGLIBC)/lib/; \
		$(CP) $(STAGING_DIR)/lib/$$file-$(PKG_VERSION).so $(IDIR_EGLIBC)/lib/; \
	done
	# install linker script
	-cp ./files/libc.so.$(CPU_ARCH) $(IDIR_EGLIBC)/usr/lib/libc.so
	cd $(IDIR_EGLIBC)/lib && ln -sf libm.so.6 libm.so
	cd $(IDIR_EGLIBC)/lib && ln -sf libutil.so.1 libutil.so
	cd $(IDIR_EGLIBC)/lib && ln -sf librt.so.1 librt.so
	cd $(IDIR_EGLIBC)/lib && ln -sf libcrypt.so.1 libcrypt.so
	cd $(IDIR_EGLIBC)/lib && ln -sf libdl.so.2 libdl.so

eglibc-dev-install:
	# header package
	$(MAKE) -C $(TOOLCHAIN_BUILD_DIR)/linux-$(KERNEL_VERSION) \
		HOSTCC=$(HOSTCC) ARCH=$(ARCH) V=1 \
		INSTALL_HDR_PATH=$(IDIR_EGLIBC_DEV)/usr \
		headers_install
	(cd $(WRKBUILD); \
		${EGLIBC_ENV} \
		$(TOOLCHAIN_BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)/libc/configure \
			--prefix=$(IDIR_EGLIBC_DEV)/usr \
			--with-headers=$(IDIR_EGLIBC_DEV)/usr/include \
			${EGLIBC_CONFOPTS} \
	);
	PATH='${TARGET_PATH}' \
	$(MAKE) -C $(WRKBUILD) \
		install-headers install-bootstrap-headers=yes
	@find $(IDIR_EGLIBC_DEV) -name .install -exec rm {} \;

include ${TOPDIR}/mk/pkg-bottom.mk
