# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include ../rules.mk
include Makefile.inc
include ${TOPDIR}/mk/buildhlp.mk

ifneq ($(ADK_DEBUG),)
TARGET_CFLAGS+=		-O2
endif
# ssp partially supported
TARGET_CFLAGS:= $(filter-out -fstack-protector,$(TARGET_CFLAGS))

EGLIBC_CONFOPTS:=	--build=$(GNU_HOST_NAME) \
			--without-cvs \
			--disable-profile \
			--disable-debug \
			--enable-kernel=2.6.0 \
			--without-gd \
			--with-__thread \
			--with-tls \
			--enable-add-ons \
			$(NLS)

EGLIBC_ENV:=		PATH='${TARGET_PATH}' \
			BUILD_CC=${CC_FOR_BUILD} \
			CFLAGS="$(TARGET_CFLAGS)" \
			CC=${REAL_GNU_TARGET_NAME}-gcc \
			CXX=${REAL_GNU_TARGET_NAME}-g++ \
			AR=${REAL_GNU_TARGET_NAME}-ar \
			RANLIB=${REAL_GNU_TARGET_NAME}-ranlib \
			libc_cv_cc_with_libunwind=no \
			libc_cv_forced_unwind=yes \
			libc_cv_c_cleanup=yes \
			libc_cv_gnu99_inline=yes \
			libc_cv_initfini_array=yes \
			libc_cv_slibdir="/lib"

ifeq ($(ADK_TARGET_NO_FPU),y)
EGLIBC_CONFOPTS+=       --without-fp
endif

EGLIBC_BUILD_DIR_INITIAL:=	${WRKDIR}/$(PKG_NAME)-$(PKG_VERSION)-headers
EGLIBC_BUILD_DIR_INITIAL32:=	${WRKDIR}/$(PKG_NAME)-$(PKG_VERSION)-headers32
EGLIBC_BUILD_DIR_FINAL:=	${WRKDIR}/$(PKG_NAME)-$(PKG_VERSION)-final
EGLIBC_BUILD_DIR_FINAL32:=	${WRKDIR}/$(PKG_NAME)-$(PKG_VERSION)-final32

ifeq ($(ADK_TARGET_WITH_MULTILIB),y)
$(WRKBUILD)/.headers_configure: $(WRKBUILD)/.headers_configure32
else
$(WRKBUILD)/.headers_configure:
endif
	mkdir -p $(EGLIBC_BUILD_DIR_INITIAL)
	(cd ${WRKDIR}/$(PKG_NAME)-$(PKG_VERSION); \
		ln -sf ../ports ${WRKDIR}/$(PKG_NAME)-$(PKG_VERSION)/libc);
	$(CP) ${TOPDIR}/toolchain/eglibc/eglibc.config \
		$(EGLIBC_BUILD_DIR_INITIAL)/option-groups.config
	(cd $(EGLIBC_BUILD_DIR_INITIAL); \
		${EGLIBC_ENV} \
		$(WRKBUILD)/libc/configure \
			--prefix=$(STAGING_TARGET_DIR)/usr \
			--with-headers=$(STAGING_TARGET_DIR)/usr/include \
			--host=$(REAL_GNU_TARGET_NAME) \
			${EGLIBC_CONFOPTS} \
	);
	touch $@

$(WRKBUILD)/.headers: $(WRKBUILD)/.headers_configure
	(cd $(EGLIBC_BUILD_DIR_INITIAL); \
		PATH='${TARGET_PATH}' \
		${EGLIBC_ENV} \
		$(MAKE) install-headers install-bootstrap-headers=yes cross-compiling=yes \
	);
	touch $(STAGING_TARGET_DIR)/usr/include/gnu/stubs.h
	touch $(STAGING_TARGET_DIR)/usr/include/gnu/stubs-64.h
	touch $@

$(WRKBUILD)/.headers_configure32:
	mkdir -p $(EGLIBC_BUILD_DIR_INITIAL32)
	(cd ${WRKDIR}/$(PKG_NAME)-$(PKG_VERSION); \
		ln -sf ../ports ${WRKDIR}/$(PKG_NAME)-$(PKG_VERSION)/libc);
	$(CP) ${TOPDIR}/toolchain/eglibc/eglibc.config \
		$(EGLIBC_BUILD_DIR_INITIAL32)/option-groups.config
	(cd $(EGLIBC_BUILD_DIR_INITIAL32); \
		${EGLIBC_ENV} \
		CC='${REAL_GNU_TARGET_NAME}-gcc -m32' \
		$(WRKBUILD)/libc/configure \
			--prefix=$(STAGING_TARGET_DIR_32)/usr \
			--with-headers=$(STAGING_TARGET_DIR_32)/usr/include \
			--host=i486-openadk-linux-gnu \
			${EGLIBC_CONFOPTS} \
	);
	(cd $(EGLIBC_BUILD_DIR_INITIAL32); \
		PATH='${TARGET_PATH}' \
		${EGLIBC_ENV} \
		CC='${REAL_GNU_TARGET_NAME}-gcc -m32' \
		$(MAKE) install-headers install-bootstrap-headers=yes cross-compiling=yes \
	);
	touch $(STAGING_TARGET_DIR_32)/usr/include/gnu/stubs.h
	touch $(STAGING_TARGET_DIR_32)/usr/include/gnu/stubs-64.h
	touch $@

ifeq ($(ADK_TOOLCHAIN_GCC_USE_SSP),y)
EGLIBC_ENV+=		libc_cv_ssp=yes
else
EGLIBC_ENV+=		libc_cv_ssp=no
endif

ifeq ($(ADK_TARGET_WITH_MULTILIB),y)
$(WRKBUILD)/.configured: $(WRKBUILD)/.configured32
else
$(WRKBUILD)/.configured:
endif
	mkdir -p $(EGLIBC_BUILD_DIR_FINAL)
	$(CP) ${TOPDIR}/toolchain/eglibc/eglibc.config \
		$(EGLIBC_BUILD_DIR_FINAL)/option-groups.config
	(cd $(EGLIBC_BUILD_DIR_FINAL); \
		${EGLIBC_ENV} \
		$(WRKBUILD)/libc/configure \
			--prefix=/usr \
			--enable-shared \
			--enable-stackguard-randomization \
			--host=$(REAL_GNU_TARGET_NAME) \
			${EGLIBC_CONFOPTS} \
	);
	touch $@

$(EGLIBC_BUILD_DIR_FINAL)/libc.so:
$(WRKBUILD)/.compiled: $(WRKBUILD)/.configured
	${EGLIBC_ENV} $(MAKE) -C $(EGLIBC_BUILD_DIR_FINAL) cross-compiling=yes all
	touch $@

$(WRKBUILD)/.installed: $(EGLIBC_BUILD_DIR_FINAL)/libc.so
	${EGLIBC_ENV} $(MAKE) -C $(EGLIBC_BUILD_DIR_FINAL) install_root=$(STAGING_TARGET_DIR) install
	${INSTALL_DATA} ${WRKBUILD}/libc/posix/gai.conf ${STAGING_TARGET_DIR}/etc/
	${INSTALL_DATA} ${WRKBUILD}/libc/nscd/nscd.conf ${STAGING_TARGET_DIR}/etc/
	${INSTALL_DATA} ${WRKBUILD}/libc/nss/nsswitch.conf ${STAGING_TARGET_DIR}/etc/
	touch $@

$(WRKBUILD)/.configured32:
	mkdir -p $(EGLIBC_BUILD_DIR_FINAL32)
	$(CP) ${TOPDIR}/toolchain/eglibc/eglibc.config \
		$(EGLIBC_BUILD_DIR_FINAL32)/option-groups.config
	(cd $(EGLIBC_BUILD_DIR_FINAL32); \
		${EGLIBC_ENV} \
		CC='${REAL_GNU_TARGET_NAME}-gcc -m32' \
		$(WRKBUILD)/libc/configure \
			--prefix=/usr \
			--enable-shared \
			--enable-stackguard-randomization \
			--host=i486-openadk-linux-gnu \
			${EGLIBC_CONFOPTS} \
	);
	${EGLIBC_ENV} $(MAKE) -C $(EGLIBC_BUILD_DIR_FINAL32) cross-compiling=yes all
	${EGLIBC_ENV} $(MAKE) -C $(EGLIBC_BUILD_DIR_FINAL32) install_root=$(STAGING_TARGET_DIR_32) install
	mkdir -p $(STAGING_TARGET_DIR)/lib/$(REAL_GNU_TARGET_NAME)/4.7.2/32
	$(CP) $(STAGING_TARGET_DIR_32)/lib/* $(STAGING_TARGET_DIR_32)/usr/lib/* \
		$(STAGING_TARGET_DIR)/lib/$(REAL_GNU_TARGET_NAME)/4.7.2/32
	-rm $(STAGING_TARGET_DIR)/lib/$(REAL_GNU_TARGET_NAME)/4.7.2/32/libc.so
	touch $@

$(WRKBUILD)/.configuredx32:
	mkdir -p $(EGLIBC_BUILD_DIR_FINALX32)
	$(CP) ${TOPDIR}/toolchain/eglibc/eglibc.config \
		$(EGLIBC_BUILD_DIR_FINALX32)/option-groups.config
	(cd $(EGLIBC_BUILD_DIR_FINALX32); \
		${EGLIBC_ENV} \
		CC=${REAL_GNU_TARGET_NAME}-gcc -mx32 \
		$(WRKBUILD)/libc/configure \
			--prefix=/usr \
			--enable-shared \
			--enable-stackguard-randomization \
			--host=x86_64-x32-openadk-linux-gnu \
			${EGLIBC_CONFOPTS} \
	);
	${EGLIBC_ENV} $(MAKE) -C $(EGLIBC_BUILD_DIR_FINALX32) cross-compiling=yes all
	${EGLIBC_ENV} $(MAKE) -C $(EGLIBC_BUILD_DIR_FINALX32) install_root=$(STAGING_TARGET_DIR_X32) install
	touch $@


include ${TOPDIR}/mk/toolchain.mk
