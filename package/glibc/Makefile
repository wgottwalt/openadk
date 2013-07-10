# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

TARGET_CFLAGS:=		$(filter-out -fstack-protector,$(TARGET_CFLAGS))
TARGET_CFLAGS:=		$(filter-out -flto,$(TARGET_CFLAGS))

include $(TOPDIR)/toolchain/glibc/Makefile.inc
include $(TOPDIR)/toolchain/glibc/Makefile.multilib

PKG_DESCR:=		GNU C library
PKG_VER:=		2.16
PKG_SECTION:=		base
PKG_OPTS:=		noremove
PKG_SUBPKGS:=		GLIBC GLIBC_DEV GLIBC_STATIC
PKG_DEPENDS:=		tzdata

NO_DISTFILES:=		1

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,GLIBC,glibc,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))
$(eval $(call PKG_template,GLIBC_DEV,glibc-dev,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))
$(eval $(call PKG_template,GLIBC_STATIC,$(PKG_NAME)-static,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

#TARGET_CFLAGS:=	$(filter-out -fstack-protector,$(TARGET_CFLAGS))
#TARGET_CFLAGS:=	$(filter-out -flto,$(TARGET_CFLAGS))
XAKE_FLAGS+=		GCC_HONOUR_COPTS=s

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

# compile nothing, glibc is already build in toolchain directory
do-install:
ifeq ($(ADK_TARGET_WITH_MULTILIB),y)
	for abi in $(TABI); do \
		${INSTALL_DIR} $(IDIR_GLIBC)/lib$${abi/*:/} $(IDIR_GLIBC)/usr/lib$${abi/*:/} ; \
		$(CP) $(STAGING_TARGET_DIR)/lib/ld* $(IDIR_GLIBC)/lib$${abi/*:/} ; \
		-for file in libc libcrypt libdl libm libresolv libutil libnsl libnss_dns libnss_files; do \
			$(CP) $(STAGING_TARGET_DIR)-$${abi/*:/}/lib/$$file.so* $(IDIR_GLIBC)/lib$${abi/*:/}; \
			$(CP) $(STAGING_TARGET_DIR)-$${abi/*:/}/lib/$$file-$(PKG_VERSION).so $(IDIR_GLIBC)/lib$${abi/*:/}; \
		done ; \
	done
else
	${INSTALL_DIR} ${IDIR_GLIBC}/$(ADK_TARGET_LIBC_PATH)
	$(CP) $(STAGING_TARGET_DIR)/lib/ld*.so* $(IDIR_GLIBC)/$(ADK_TARGET_LIBC_PATH)
	for file in libc libcrypt libdl libm libnsl libresolv libutil libnss_compat libnss_dns libnss_files; do \
		$(CP) $(STAGING_TARGET_DIR)/lib/$$file.so* $(IDIR_GLIBC)/$(ADK_TARGET_LIBC_PATH); \
		$(CP) $(STAGING_TARGET_DIR)/lib/$$file-$(PKG_VER).so $(IDIR_GLIBC)/$(ADK_TARGET_LIBC_PATH); \
	done
	${INSTALL_DIR} $(IDIR_GLIBC)/usr/bin
	$(CP) $(STAGING_TARGET_DIR)/usr/bin/getconf $(IDIR_GLIBC)/usr/bin
ifeq ($(ADK_LOCALES),y)
	$(CP) $(STAGING_TARGET_DIR)/usr/bin/locale $(IDIR_GLIBC)/usr/bin
endif
endif
	${INSTALL_DIR} ${IDIR_GLIBC}/etc
	${INSTALL_DATA} ${STAGING_TARGET_DIR}/etc/{gai,nscd,nsswitch}.conf ${IDIR_GLIBC}/etc

glibc-static-install:
	${INSTALL_DIR} $(IDIR_GLIBC_STATIC)/usr/lib
	$(CP) $(STAGING_TARGET_DIR)/usr/lib/libc.a $(IDIR_GLIBC_STATIC)/usr/lib

glibc-dev-install:
	echo $(TARGET_CFLAGS)
	${INSTALL_DIR} $(IDIR_GLIBC_DEV)/$(ADK_TARGET_LIBC_PATH) $(IDIR_GLIBC_DEV)/usr/lib
	# install linker script
	-cp ./files/libc.so.$(CPU_ARCH) $(IDIR_GLIBC_DEV)/usr/lib/libc.so
ifeq ($(ADK_TARGET_ABI_O32),y)
	$(SED) "s#@@ELFFORMAT@@#elf32-tradlittlemips#" $(IDIR_GLIBC_DEV)/usr/lib/libc.so
endif
ifeq ($(ADK_TARGET_ABI_N32),y)
	$(SED) "s#@@ELFFORMAT@@#elf32-ntradlittlemips#" $(IDIR_GLIBC_DEV)/usr/lib/libc.so
endif
ifeq ($(ADK_TARGET_ABI_N64),y)
	$(SED) "s#@@ELFFORMAT@@#elf64-tradlittlemips#" $(IDIR_GLIBC_DEV)/usr/lib/libc.so
endif
	${CP} ${STAGING_TARGET_DIR}/usr/lib/crt* ${IDIR_GLIBC_DEV}/usr/lib
	${CP} ${STAGING_TARGET_DIR}/usr/lib/libc_nonshared.a ${IDIR_GLIBC_DEV}/usr/lib
	-for file in libcrypt libdl libm libresolv libutil; do \
		cd $(IDIR_GLIBC_DEV)/$(ADK_TARGET_LIBC_PATH); ln -sf $$file-$(PKG_VER).so $$file.so; \
	done
	# header package
	$(MAKE) -C $(TOOLCHAIN_BUILD_DIR)/w-linux-$(KERNEL_VERSION)-$(KERNEL_RELEASE)/linux-$(KERNEL_VERSION) \
		HOSTCC=$(CC_FOR_BUILD) ARCH=$(ARCH) V=1 \
		INSTALL_HDR_PATH=$(IDIR_GLIBC_DEV)/usr \
		headers_install
	(cd $(WRKBUILD); \
		$(GLIBC_ENV) \
		GCC_HONOUR_COPTS=s \
		$(TOOLCHAIN_BUILD_DIR)/w-$(PKG_NAME)-$(PKG_VERSION)-$(PKG_RELEASE)/$(PKG_NAME)-$(PKG_VERSION)/configure \
			--prefix=$(IDIR_GLIBC_DEV)/usr \
			--with-sysroot=$(IDIR_GLIBC_DEV) \
			${GLIBC_CONFOPTS} \
	);
	$(GLIBC_ENV) $(MAKE) -C $(WRKBUILD) cross-compiling=yes install-headers
	touch $(IDIR_GLIBC_DEV)/usr/include/gnu/stubs.h
	touch $(IDIR_GLIBC_DEV)/usr/include/gnu/stubs-{32,x32,64}.h
	touch $(IDIR_GLIBC_DEV)/usr/include/bits/stdio_lim.h
	# WORKAROUND: bits/syscall.h is only installed via install-others target
	$(CP) $(STAGING_TARGET_DIR)/usr/include/bits/syscall.h \
		$(IDIR_GLIBC_DEV)/usr/include/bits
	@find $(IDIR_GLIBC_DEV) -name .install -exec rm {} \;

include ${TOPDIR}/mk/pkg-bottom.mk
