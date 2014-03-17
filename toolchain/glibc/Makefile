# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include ../rules.mk

# glibc does not compile with Os
TARGET_CFLAGS:=		$(subst Os,O2,$(TARGET_CFLAGS))
ifneq ($(ADK_DEBUG),)
TARGET_CFLAGS+=		-O2
endif

# ssp partially supported
TARGET_CFLAGS:=		$(filter-out -fstack-protector,$(TARGET_CFLAGS))

include Makefile.inc
include ${TOPDIR}/mk/buildhlp.mk

GLIBC_MAKEOPTS+=	cross-compiling=yes
ifeq (${ADK_MAKE_PARALLEL},y)
GLIBC_MAKEOPTS+=	PARALLELMFLAGS="-j1"
endif

GLIBC_BUILD_DIR_INITIAL:=	${WRKDIR}/$(PKG_NAME)-$(PKG_VERSION)-headers
GLIBC_BUILD_DIR_FINAL:=		${WRKDIR}/$(PKG_NAME)-$(PKG_VERSION)-final

$(WRKBUILD)/.headers_configure:
	mkdir -p $(GLIBC_BUILD_DIR_INITIAL)
	(cd $(GLIBC_BUILD_DIR_INITIAL); \
		${GLIBC_ENV} \
		$(WRKBUILD)/configure \
			--prefix=$(STAGING_TARGET_DIR)/usr \
			--with-sysroot=$(STAGING_TARGET_DIR) \
			${GLIBC_CONFOPTS} \
	);
	touch $@

$(WRKBUILD)/.headers: $(WRKBUILD)/.headers_configure
	(cd $(GLIBC_BUILD_DIR_INITIAL); \
		${GLIBC_ENV} \
		$(MAKE) ${GLIBC_MAKEOPTS} install-headers \
	);
	touch $(STAGING_TARGET_DIR)/usr/include/gnu/stubs.h
	touch $(STAGING_TARGET_DIR)/usr/include/gnu/stubs-{32,x32,64,soft,hard}.h
	touch $@

$(WRKBUILD)/.configured:
	mkdir -p $(GLIBC_BUILD_DIR_FINAL)
	(cd $(GLIBC_BUILD_DIR_FINAL); \
		${GLIBC_ENV} \
		$(WRKBUILD)/configure \
			--prefix=/usr \
			--enable-shared \
			--enable-stackguard-randomization \
			${GLIBC_CONFOPTS} \
	);
	touch $@

$(WRKBUILD)/.compiled:
	${GLIBC_ENV} $(MAKE) ${GLIBC_MAKEOPTS} -C $(GLIBC_BUILD_DIR_FINAL) all
	touch $@

$(WRKBUILD)/.installed:
	${GLIBC_ENV} $(MAKE) -C $(GLIBC_BUILD_DIR_FINAL) install_root=$(STAGING_TARGET_DIR) install
	mkdir -p ${STAGING_TARGET_DIR}/etc
	${INSTALL_DATA} ${WRKBUILD}/posix/gai.conf ${STAGING_TARGET_DIR}/etc
	${INSTALL_DATA} ${WRKBUILD}/nscd/nscd.conf ${STAGING_TARGET_DIR}/etc
	${INSTALL_DATA} ${WRKBUILD}/nss/nsswitch.conf ${STAGING_TARGET_DIR}/etc
	touch $@

$(WRKBUILD)/.fixup:
	-find $(STAGING_TARGET_DIR) $(STAGING_HOST_DIR) -name \*.la -delete
	-find $(STAGING_TARGET_DIR) -type f -name \*_pic\* -delete
	rm -rf $(STAGING_TARGET_DIR)/usr/share/locale $(STAGING_TARGET_DIR)/usr/share/i18n
	rm -rf $(STAGING_TARGET_DIR)/usr/lib/gconv
ifeq ($(ADK_TOOLCHAIN),y)
	# strip target libs and host tools for toolchain builds
	PATH="$(TARGET_PATH)" debug='0' prefix='${TARGET_CROSS}' ${BASH} ${SCRIPT_DIR}/rstrip.sh $(STAGING_TARGET_DIR)
	debug='0' prefix=' ' ${BASH} ${SCRIPT_DIR}/rstrip.sh $(STAGING_HOST_DIR)/bin $(STAGING_HOST_DIR)/$(GNU_TARGET_NAME)/
endif
	touch $@

include ${TOPDIR}/mk/toolchain.mk
