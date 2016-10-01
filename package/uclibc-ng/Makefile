# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk
include $(ADK_TOPDIR)/mk/kernel-ver.mk
include $(ADK_TOPDIR)/mk/kernel-vars.mk
include $(ADK_TOPDIR)/toolchain/uclibc-ng/Makefile.inc

PKG_NAME:=		uClibc-ng
PKG_DESCR:=		embedded c library
PKG_SECTION:=		base/libs
PKG_OPTS:=		noremove nostaging noscripts

PKG_SUBPKGS:=		UCLIBC_NG UCLIBC_NG_DEV UCLIBC_NG_TEST
PKGSD_UCLIBC_NG_DEV:=	development files for uclibc-ng
PKGSC_UCLIBC_NG_DEV:=	devel
PKGSD_UCLIBC_NG_TEST:=	test suite for uclibc-ng
PKGSS_UCLIBC_NG_TEST:=	make

NO_DISTFILES:=		1

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,UCLIBC_NG,uclibc-ng,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))
$(eval $(call PKG_template,UCLIBC_NG_DEV,uclibc-ng-dev,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_UCLIBC_NG_DEV},${PKGSC_UCLIBC_NG_DEV},${PKG_OPTS}))
$(eval $(call PKG_template,UCLIBC_NG_TEST,uclibc-ng-test,$(PKG_VERSION)-${PKG_RELEASE},${PKGSS_UCLIBC_NG_TEST},${PKGSD_UCLIBC_NG_TEST},${PKG_SECTION},${PKG_OPTS}))

CONFIG_STYLE:=          manual
BUILD_STYLE:=           manual
INSTALL_STYLE:=         manual

do-build:
ifeq ($(ADK_PACKAGE_UCLIBC_NG_TEST),y)
	PATH='$(HOST_PATH)' $(MAKE) -j1 -C $(TOOLCHAIN_BUILD_DIR)/w-$(PKG_NAME)-$(PKG_VERSION)-$(PKG_RELEASE)/${PKG_NAME}-${PKG_VERSION} \
		HOSTCC='$(HOST_CC)' \
		CC='$(TARGET_CC)' \
		PREFIX=$(STAGING_TARGET_DIR) \
		DEVEL_PREFIX=/usr/ \
		DEVEL_PREFIX_LIB=/ \
		RUNTIME_PREFIX=/ \
		UCLIBC_EXTRA_CFLAGS="$(TARGET_CFLAGS)" \
		UCLIBC_EXTRA_LDFLAGS="$(TARGET_LDFLAGS)" \
		TEST_INSTALLED_UCLIBC=1 \
		UCLIBC_ONLY=1 \
		VERBOSE=1 \
		test_gen test_compile
endif

do-install:
	${INSTALL_DIR} $(IDIR_UCLIBC_NG)/$(ADK_TARGET_LIBC_PATH) $(IDIR_UCLIBC_NG)/etc
	test -z $(ADK_RUNTIME_TIMEZONE) || \
	    grep $(ADK_RUNTIME_TIMEZONE) ./files/tz.lst | \
	    cut -f 2 > $(IDIR_UCLIBC_NG)/etc/TZ
ifneq ($(ADK_TARGET_USE_STATIC_LIBS)$(ADK_TARGET_BINFMT_FLAT),y)
	$(CP) $(STAGING_TARGET_DIR)/lib/libc.so.* $(IDIR_UCLIBC_NG)/$(ADK_TARGET_LIBC_PATH)
	$(CP) $(STAGING_TARGET_DIR)/lib/libuClibc-*.so \
		$(IDIR_UCLIBC_NG)/$(ADK_TARGET_LIBC_PATH)
	$(CP) $(STAGING_TARGET_DIR)/lib/ld*-uClibc-*.so \
		$(IDIR_UCLIBC_NG)/$(ADK_TARGET_LIBC_PATH)
	$(CP) $(STAGING_TARGET_DIR)/lib/ld*-uClibc*.so.* $(IDIR_UCLIBC_NG)/$(ADK_TARGET_LIBC_PATH)
	-for file in libcrypt libdl libm libnsl libresolv libutil libuargp; do \
		$(CP) $(STAGING_TARGET_DIR)/lib/$$file.so* $(IDIR_UCLIBC_NG)/$(ADK_TARGET_LIBC_PATH); \
		$(CP) $(STAGING_TARGET_DIR)/lib/$$file-*.so \
			$(IDIR_UCLIBC_NG)/$(ADK_TARGET_LIBC_PATH); \
	done
endif
ifeq ($(ADK_RUNTIME_ENABLE_LOCALE),y)
	${INSTALL_DIR} $(IDIR_UCLIBC_NG)/usr/bin
	$(INSTALL_BIN) $(STAGING_TARGET_DIR)/usr/bin/locale $(IDIR_UCLIBC_NG)/usr/bin
endif

uclibc-ng-dev-install:
	${INSTALL_DIR} ${IDIR_UCLIBC_NG_DEV}/usr/lib ${IDIR_UCLIBC_NG_DEV}/$(ADK_TARGET_LIBC_PATH)
	${CP} ${STAGING_TARGET_DIR}/usr/lib/libc.so ${IDIR_UCLIBC_NG_DEV}/usr/lib
	${CP} ${STAGING_TARGET_DIR}/usr/lib/uclibc_nonshared.a ${IDIR_UCLIBC_NG_DEV}/usr/lib
ifeq ($(ADK_TARGET_LIB_WITH_THREADS),y)
	-${CP} ${STAGING_TARGET_DIR}/usr/lib/libpthread.so ${IDIR_UCLIBC_NG_DEV}/usr/lib
	-${CP} ${STAGING_TARGET_DIR}/usr/lib/libpthread_nonshared.a ${IDIR_UCLIBC_NG_DEV}/usr/lib
endif
	${CP} ${STAGING_TARGET_DIR}/usr/lib/crt*.o ${IDIR_UCLIBC_NG_DEV}/usr/lib
	for file in libcrypt libdl libm libresolv libutil libuargp; do \
		cd $(IDIR_UCLIBC_NG_DEV)/$(ADK_TARGET_LIBC_PATH); ln -sf $$file-$(PKG_VERSION).so $$file.so; \
	done
	${KERNEL_MAKE_ENV} \
	$(MAKE) -C $(TOOLCHAIN_BUILD_DIR)/w-linux-$(KERNEL_VERSION)/linux-$(KERNEL_FILE_VER) \
		$(KERNEL_MAKE_OPTS) \
		INSTALL_HDR_PATH=$(IDIR_UCLIBC_NG_DEV)/usr \
		headers_install
	$(MAKE) -C $(TOOLCHAIN_BUILD_DIR)/w-$(PKG_NAME)-$(PKG_VERSION)-$(PKG_RELEASE)/${PKG_NAME}-${PKG_VERSION} \
		PREFIX=$(IDIR_UCLIBC_NG_DEV)/ \
		DEVEL_PREFIX=/usr/ \
		RUNTIME_PREFIX=$(IDIR_UCLIBC_NG_DEV)/ \
		HOSTCC="$(CC_FOR_BUILD)" \
		CPU_CFLAGS="$(TARGET_CFLAGS)" \
		install_headers
	@find $(IDIR_UCLIBC_NG_DEV) -name .install -exec rm {} \;
	@find $(IDIR_UCLIBC_NG_DEV) -name ..install.cmd -exec rm {} \;

uclibc-ng-test-install:
	${INSTALL_DIR} ${IDIR_UCLIBC_NG_TEST}/etc
	echo '00:11:22:33:44:55 teeth' > ${IDIR_UCLIBC_NG_TEST}/etc/ethers
	${INSTALL_DIR} ${IDIR_UCLIBC_NG_TEST}/opt/uclibc-ng
	${CP} $(TOOLCHAIN_BUILD_DIR)/w-$(PKG_NAME)-$(PKG_VERSION)-$(PKG_RELEASE)/${PKG_NAME}-${PKG_VERSION}/test \
		${IDIR_UCLIBC_NG_TEST}/opt/uclibc-ng
	@find ${IDIR_UCLIBC_NG_TEST}/opt/uclibc-ng -name \*.o -exec rm {} \;

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
