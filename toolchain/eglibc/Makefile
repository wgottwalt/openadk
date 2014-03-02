# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include ../rules.mk

# eglibc does not compile with Os on some architectures
ifeq ($(ADK_LINUX_SPARC),y)
TARGET_CFLAGS_LIBC:=	$(subst Os,O2,$(TARGET_CFLAGS))
endif
ifeq ($(ADK_LINUX_MICROBLAZE),y)
TARGET_CFLAGS_LIBC:=	$(subst Os,O2,$(TARGET_CFLAGS))
endif
ifeq ($(ADK_LINUX_PPC64),y)
TARGET_CFLAGS_LIBC:=	$(subst Os,O2,$(TARGET_CFLAGS))
endif

# ssp not supported
TARGET_CFLAGS_LIBC:= 	$(filter-out -fstack-protector,$(TARGET_CFLAGS_LIBC))

include Makefile.inc
include ${TOPDIR}/mk/buildhlp.mk

EGLIBC_BUILD_DIR_INITIAL:=	${WRKDIR}/$(PKG_NAME)-$(PKG_VERSION)-headers
EGLIBC_BUILD_DIR_FINAL:=	${WRKDIR}/$(PKG_NAME)-$(PKG_VERSION)-final

$(WRKBUILD)/.headers_configure:
	mkdir -p $(EGLIBC_BUILD_DIR_INITIAL)
	$(CP) ${TOPDIR}/toolchain/eglibc/eglibc.config \
		$(WRKBUILD)/libc/option-groups.config
	(cd $(EGLIBC_BUILD_DIR_INITIAL); \
		${EGLIBC_ENV} \
		CC="${GNU_TARGET_NAME}-gcc $(ADK_TARGET_ABI_CFLAGS)" \
		$(WRKBUILD)/libc/configure \
			--prefix=$(STAGING_TARGET_DIR)/usr \
			--with-headers=$(STAGING_TARGET_DIR)/usr/include \
			--host=$(GNU_TARGET_NAME) \
			${EGLIBC_CONFOPTS} \
	);
	touch $@

$(WRKBUILD)/.headers: $(WRKBUILD)/.headers_configure
	(cd $(EGLIBC_BUILD_DIR_INITIAL); \
		${EGLIBC_ENV} \
		CC="${GNU_TARGET_NAME}-gcc $(ADK_TARGET_ABI_CFLAGS)" \
		$(MAKE) install-headers install-bootstrap-headers=yes cross-compiling=yes \
	);
	touch $(STAGING_TARGET_DIR)/usr/include/gnu/stubs.h
	touch $(STAGING_TARGET_DIR)/usr/include/gnu/stubs-{32,x32,64,o32,n32,soft,hard}.h
	touch $@

ifeq ($(ADK_TOOLCHAIN_GCC_USE_SSP),y)
EGLIBC_ENV+=		libc_cv_ssp=yes
else
EGLIBC_ENV+=		libc_cv_ssp=no
endif

$(WRKBUILD)/.configured:
	mkdir -p $(EGLIBC_BUILD_DIR_FINAL)
	$(CP) ${TOPDIR}/toolchain/eglibc/eglibc.config \
		$(EGLIBC_BUILD_DIR_FINAL)/option-groups.config
	(cd $(EGLIBC_BUILD_DIR_FINAL); \
		${EGLIBC_ENV} \
		CC="${GNU_TARGET_NAME}-gcc $(ADK_TARGET_ABI_CFLAGS)" \
		$(WRKBUILD)/libc/configure \
			--prefix=/usr \
			--enable-shared \
			--enable-stackguard-randomization \
			--host=$(GNU_TARGET_NAME) \
			${EGLIBC_CONFOPTS} \
	);
	touch $@

$(EGLIBC_BUILD_DIR_FINAL)/libc.so:
$(WRKBUILD)/.compiled: $(WRKBUILD)/.configured
	${EGLIBC_ENV} \
	CC="${GNU_TARGET_NAME}-gcc $(ADK_TARGET_ABI_CFLAGS)" \
		$(MAKE) -C $(EGLIBC_BUILD_DIR_FINAL) cross-compiling=yes all
	touch $@

$(WRKBUILD)/.installed: $(EGLIBC_BUILD_DIR_FINAL)/libc.so
	${EGLIBC_ENV} \
	CC="${GNU_TARGET_NAME}-gcc $(ADK_TARGET_ABI_CFLAGS)" \
		$(MAKE) -C $(EGLIBC_BUILD_DIR_FINAL) install_root=$(STAGING_TARGET_DIR) install
	${INSTALL_DIR} ${STAGING_TARGET_DIR}/etc
	${INSTALL_DATA} ${WRKBUILD}/libc/posix/gai.conf ${STAGING_TARGET_DIR}/etc/
	${INSTALL_DATA} ${WRKBUILD}/libc/nss/nsswitch.conf ${STAGING_TARGET_DIR}/etc/
	touch $@

$(WRKBUILD)/.fixup:
	-find $(STAGING_TARGET_DIR) $(STAGING_HOST_DIR) -name \*.la -delete
	-find $(STAGING_TARGET_DIR) -type -f -name \*_pic\* -delete
	rm -rf $(STAGING_TARGET_DIR)/usr/share/locale $(STAGING_TARGET_DIR)/usr/share/i18n
	rm -rf $(STAGING_TARGET_DIR)/usr/lib/gconv
	PATH="$(TARGET_PATH)" debug='' prefix='${TARGET_CROSS}' ${BASH} ${SCRIPT_DIR}/rstrip.sh $(STAGING_TARGET_DIR)
	debug='' prefix=' ' ${BASH} ${SCRIPT_DIR}/rstrip.sh $(STAGING_HOST_DIR)
	touch $@

include ${TOPDIR}/mk/toolchain.mk
