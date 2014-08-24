# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk
include $(ADK_TOPDIR)/mk/kernel-ver.mk
include $(ADK_TOPDIR)/mk/kernel-vars.mk
include $(ADK_TOPDIR)/toolchain/uclibc/Makefile.inc

PKG_NAME:=		uClibc
PKG_DESCR:=		embedded c library
PKG_SECTION:=		base/libs
PKG_OPTS:=		noremove nostaging noscripts

PKG_SUBPKGS:=		UCLIBC UCLIBC_DEV UCLIBC_TEST
PKGSD_UCLIBC_DEV:=	development files for uclibc
PKGSC_UCLIBC_DEV:=	devel
PKGSD_UCLIBC_TEST:=	test suite for uclibc
PKGSS_UCLIBC_TEST:=	make

NO_DISTFILES:=		1

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,UCLIBC,uclibc,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))
$(eval $(call PKG_template,UCLIBC_DEV,uclibc-dev,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_UCLIBC_DEV},${PKGSC_UCLIBC_DEV},${PKG_OPTS}))
$(eval $(call PKG_template,UCLIBC_TEST,uclibc-test,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_UCLIBC_TEST},${PKGSC_UCLIBC_TEST},${PKG_OPTS}))

CONFIG_STYLE:=          manual
BUILD_STYLE:=           manual
INSTALL_STYLE:=         manual

do-install:
	${INSTALL_DIR} $(IDIR_UCLIBC)/$(ADK_TARGET_LIBC_PATH) $(IDIR_UCLIBC)/etc
	test -z $(ADK_RUNTIME_TIMEZONE) || \
	    grep $(ADK_RUNTIME_TIMEZONE) ./files/tz.lst | \
	    cut -f 2 > $(IDIR_UCLIBC)/etc/TZ
ifneq ($(ADK_TARGET_USE_STATIC_LIBS),y)
	$(CP) $(STAGING_TARGET_DIR)/lib/libc.so.* $(IDIR_UCLIBC)/$(ADK_TARGET_LIBC_PATH)
	$(CP) $(STAGING_TARGET_DIR)/lib/libuClibc-$(PKG_VERSION).so \
		$(IDIR_UCLIBC)/$(ADK_TARGET_LIBC_PATH)
	$(CP) $(STAGING_TARGET_DIR)/lib/ld*-uClibc-$(PKG_VERSION).so \
		$(IDIR_UCLIBC)/$(ADK_TARGET_LIBC_PATH)
	$(CP) $(STAGING_TARGET_DIR)/lib/ld*-uClibc.so.* $(IDIR_UCLIBC)/$(ADK_TARGET_LIBC_PATH)
	-for file in libcrypt libdl libm libresolv libutil; do \
		$(CP) $(STAGING_TARGET_DIR)/lib/$$file.so* $(IDIR_UCLIBC)/$(ADK_TARGET_LIBC_PATH); \
		$(CP) $(STAGING_TARGET_DIR)/lib/$$file-$(PKG_VERSION).so \
			$(IDIR_UCLIBC)/$(ADK_TARGET_LIBC_PATH); \
	done
endif

uclibc-dev-install:
	${INSTALL_DIR} ${IDIR_UCLIBC_DEV}/usr/lib ${IDIR_UCLIBC_DEV}/$(ADK_TARGET_LIBC_PATH)
	${CP} ${STAGING_TARGET_DIR}/usr/lib/libc.so ${IDIR_UCLIBC_DEV}/usr/lib
	${CP} ${STAGING_TARGET_DIR}/usr/lib/uclibc_nonshared.a ${IDIR_UCLIBC_DEV}/usr/lib
	${CP} ${STAGING_TARGET_DIR}/usr/lib/crt*.o ${IDIR_UCLIBC_DEV}/usr/lib
	for file in libcrypt libdl libm libresolv libutil; do \
		cd $(IDIR_UCLIBC_DEV)/$(ADK_TARGET_LIBC_PATH); ln -sf $$file-$(PKG_VERSION).so $$file.so; \
	done
	${KERNEL_MAKE_ENV} \
	$(MAKE) -C $(TOOLCHAIN_BUILD_DIR)/w-linux-$(KERNEL_VERSION)-$(KERNEL_RELEASE)/linux-$(KERNEL_VERSION) \
		$(KERNEL_MAKE_OPTS) \
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

uclibc-test-install:
	${INSTALL_DIR} ${IDIR_UCLIBC_TEST}/etc
	echo '00:11:22:33:44:55 teeth' > ${IDIR_UCLIBC_TEST}/etc/ethers
	${INSTALL_DIR} ${IDIR_UCLIBC_TEST}/opt/uclibc
	${CP} $(TOOLCHAIN_BUILD_DIR)/w-$(PKG_NAME)-$(PKG_VERSION)-$(PKG_RELEASE)/${PKG_NAME}-${PKG_VERSION}/test \
		${IDIR_UCLIBC_TEST}/opt/uclibc
	${CP} $(TOOLCHAIN_BUILD_DIR)/w-$(PKG_NAME)-$(PKG_VERSION)-$(PKG_RELEASE)/${PKG_NAME}-${PKG_VERSION}/{Rules.mak,.config} \
		${IDIR_UCLIBC_TEST}/opt/uclibc
	@find ${IDIR_UCLIBC_TEST}/opt/uclibc -name \*.o -exec rm {} \;
	# there is a problem with initramfs generation with the API dir. tests are disabled anyway.
	rm -rf ${IDIR_UCLIBC_TEST}/opt/uclibc/API

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
