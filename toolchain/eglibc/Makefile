# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include ../rules.mk
include Makefile.inc
include ${TOPDIR}/mk/buildhlp.mk

ifneq ($(ADK_DEBUG),)
TARGET_CFLAGS+=		-O2
endif

EGLIBC_CONFOPTS:=	--build=$(GNU_HOST_NAME) \
			--host=$(REAL_GNU_TARGET_NAME) \
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

ifeq ($(ADK_TARGET_NO_FPU),y)
EGLIBC_CONFOPTS+=       --without-fp
endif

EGLIBC_BUILD_DIR_INITIAL:=	${WRKDIR}/$(PKG_NAME)-$(PKG_VERSION)-headers
EGLIBC_BUILD_DIR_FINAL:=	${WRKDIR}/$(PKG_NAME)-$(PKG_VERSION)-final

$(WRKBUILD)/.headers_configure:
	mkdir -p $(EGLIBC_BUILD_DIR_INITIAL)
	(cd ${WRKDIR}/$(PKG_NAME)-$(PKG_VERSION); \
		ln -sf ../ports ${WRKDIR}/$(PKG_NAME)-$(PKG_VERSION)/libc);
	$(CP) ${TOPDIR}/toolchain/eglibc/eglibc.config \
		$(EGLIBC_BUILD_DIR_INITIAL)/option-groups.config
	(cd $(EGLIBC_BUILD_DIR_INITIAL); \
		${EGLIBC_ENV} \
		$(WRKBUILD)/libc/configure \
			--prefix=$(TOOLCHAIN_SYSROOT)/usr \
			--with-headers=$(TOOLCHAIN_SYSROOT)/usr/include \
			${EGLIBC_CONFOPTS} \
	);
	touch $@

$(WRKBUILD)/.headers: $(WRKBUILD)/.headers_configure
	(cd $(EGLIBC_BUILD_DIR_INITIAL); \
		PATH='${TARGET_PATH}' \
		$(MAKE) install-headers install-bootstrap-headers=yes \
	);
	touch $(TOOLCHAIN_SYSROOT)/usr/include/gnu/stubs.h
	touch $@

$(WRKBUILD)/.configured:
	mkdir -p $(EGLIBC_BUILD_DIR_FINAL)
	$(CP) ${TOPDIR}/toolchain/eglibc/eglibc.config \
		$(EGLIBC_BUILD_DIR_FINAL)/option-groups.config
	(cd $(EGLIBC_BUILD_DIR_FINAL); \
		${EGLIBC_ENV} \
		$(WRKBUILD)/libc/configure \
			--prefix=/usr \
			--enable-shared \
			--enable-stackguard-randomization \
			${EGLIBC_CONFOPTS} \
	);
	touch $@

$(EGLIBC_BUILD_DIR_FINAL)/libc.so:
$(WRKBUILD)/.compiled: $(WRKBUILD)/.configured
	${EGLIBC_ENV} $(MAKE) -C $(EGLIBC_BUILD_DIR_FINAL) all
	touch $@

$(WRKBUILD)/.installed: $(EGLIBC_BUILD_DIR_FINAL)/libc.so
	${EGLIBC_ENV} $(MAKE) -C $(EGLIBC_BUILD_DIR_FINAL) install_root=$(STAGING_TARGET_DIR) install
	${INSTALL_DATA} ${WRKBUILD}/libc/posix/gai.conf ${STAGING_TARGET_DIR}/etc/
	${INSTALL_DATA} ${WRKBUILD}/libc/nscd/nscd.conf ${STAGING_TARGET_DIR}/etc/
	${INSTALL_DATA} ${WRKBUILD}/libc/nss/nsswitch.conf ${STAGING_TARGET_DIR}/etc/
	touch $@

include ${TOPDIR}/mk/toolchain.mk
