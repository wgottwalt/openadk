# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

TARGET_CFLAGS:=	$(filter-out -fstack-protector,$(TARGET_CFLAGS))
TARGET_CFLAGS:=	$(filter-out -flto,$(TARGET_CFLAGS))

include $(TOPDIR)/toolchain/glibc/Makefile.inc

PKG_DESCR:=		GNU C library
PKG_SECTION:=		base
PKG_OPTS:=		noremove
PKG_SUBPKGS:=		GLIBC GLIBC_DEV

NO_DISTFILES:=		1

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,GLIBC,glibc,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))
$(eval $(call PKG_template,GLIBC_DEV,glibc-dev,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

TARGET_CFLAGS:=	$(filter-out -fstack-protector,$(TARGET_CFLAGS))
TARGET_CFLAGS:=	$(filter-out -flto,$(TARGET_CFLAGS))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

# compile nothing, glibc is already build in toolchain directory
do-install:
	${INSTALL_DIR} $(IDIR_GLIBC)/lib $(IDIR_GLIBC)/etc
	cd ${STAGING_TARGET_DIR} && for f in UTC ${ADK_RUNTIME_TIMEZONE}; do \
		test -s usr/share/zoneinfo/"$$f" || continue; \
		echo usr/share/zoneinfo/"$$f" | \
		    ${TOOLS_DIR}/cpio -pdu ${IDIR_GLIBC}/; \
	done
	tz=; cd ${IDIR_GLIBC}/usr/share/zoneinfo || exit 1; \
	    for f in UTC ${ADK_RUNTIME_TIMEZONE}; do \
		test -s "$$f" || continue; \
		tz=$$f; \
	done; if test x"$$tz" = x""; then \
		echo >&2 Error during timezone installation; \
		exit 1; \
	else \
		ln -sf "../usr/share/zoneinfo/$$tz" \
		    ${IDIR_GLIBC}/etc/localtime; \
	fi
	${CP} ${STAGING_TARGET_DIR}/etc/gai.conf ${IDIR_GLIBC}/etc
	${CP} ${STAGING_TARGET_DIR}/etc/nscd.conf ${IDIR_GLIBC}/etc
	${CP} ${STAGING_TARGET_DIR}/etc/nsswitch.conf ${IDIR_GLIBC}/etc
ifeq ($(ADK_TOOLCHAIN_GCC_USE_SSP),y)
	$(CP) $(STAGING_TARGET_DIR)/lib/libssp.so* $(IDIR_GLIBC)/lib
endif
	$(CP) $(STAGING_TARGET_DIR)/lib/ld*.so* $(IDIR_GLIBC)/lib
	for file in libc libcrypt libdl libm libnsl libresolv librt libutil libnss_compat libnss_dns libnss_files; do \
		$(CP) $(STAGING_TARGET_DIR)/lib/$$file.so* $(IDIR_GLIBC)/lib; \
		$(CP) $(STAGING_TARGET_DIR)/lib/$$file-$(PKG_VERSION).so $(IDIR_GLIBC)/lib; \
	done

glibc-dev-install:
	echo $(TARGET_CFLAGS)
	${INSTALL_DIR} $(IDIR_GLIBC_DEV)/lib $(IDIR_GLIBC_DEV)/usr/lib
	# install linker script
	-cp ./files/libc.so.$(CPU_ARCH) $(IDIR_GLIBC_DEV)/usr/lib/libc.so
	${CP} ${STAGING_TARGET_DIR}/usr/lib/crt* ${IDIR_GLIBC_DEV}/usr/lib
	${CP} ${STAGING_TARGET_DIR}/usr/lib/libc_nonshared.a ${IDIR_GLIBC_DEV}/usr/lib
	-for file in libcrypt libdl libm libresolv librt libutil; do \
		cd $(IDIR_GLIBC_DEV)/lib; ln -sf $$file-$(PKG_VERSION).so $$file.so; \
	done
	# header package
	$(MAKE) -C $(TOOLCHAIN_BUILD_DIR)/w-linux-$(KERNEL_VERSION)-$(KERNEL_RELEASE)/linux-$(KERNEL_VERSION) \
		HOSTCC=$(CC_FOR_BUILD) ARCH=$(ARCH) V=1 \
		INSTALL_HDR_PATH=$(IDIR_GLIBC_DEV)/usr \
		headers_install
	(cd $(WRKBUILD); \
		$(GLIBC_ENV) \
		$(TOOLCHAIN_BUILD_DIR)/w-$(PKG_NAME)-$(PKG_VERSION)-$(PKG_RELEASE)/$(PKG_NAME)-$(PKG_VERSION)/configure \
			--prefix=$(IDIR_GLIBC_DEV)/usr \
			--with-sysroot=$(IDIR_GLIBC_DEV) \
			${GLIBC_CONFOPTS} \
	);
	$(GLIBC_ENV) $(MAKE) -C $(WRKBUILD) cross-compiling=yes install-headers
	touch $(IDIR_GLIBC_DEV)/usr/include/gnu/stubs.h
	touch $(IDIR_GLIBC_DEV)/usr/include/bits/stdio_lim.h
	# WORKAROUND: bits/syscall.h is only installed via install-others target
	$(CP) $(STAGING_TARGET_DIR)/usr/include/bits/syscall.h \
		$(IDIR_GLIBC_DEV)/usr/include/bits
	@find $(IDIR_GLIBC_DEV) -name .install -exec rm {} \;

include ${TOPDIR}/mk/pkg-bottom.mk
