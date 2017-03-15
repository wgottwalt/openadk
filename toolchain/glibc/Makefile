# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk
include ../rules.mk
include Makefile.inc
include ${ADK_TOPDIR}/mk/buildhlp.mk

ifneq ($(ADK_DEBUG),)
GLIBC_FLAGS:=		-O2 -g3
else
GLIBC_FLAGS:=		-O2
endif

GLIBC_CONFOPTS:=	--build=$(GNU_HOST_NAME) \
			--host=$(GNU_TARGET_NAME) \
			--with-headers=$(STAGING_TARGET_DIR)/usr/include \
			--disable-sanity-checks \
			--disable-nls \
			--disable-werror \
			--without-cvs \
			--disable-profile \
			--without-gd \
			--disable-nscd \
			--with-__thread \
			--with-tls \
			--enable-kernel="2.6.32" \
			--enable-add-ons

ifeq ($(ADK_TARGET_FLOAT),soft)
GLIBC_CONFOPTS+=	--without-fp
endif
ifeq ($(ADK_TARGET_FLOAT),hard)
GLIBC_CONFOPTS+=	--with-fp
endif

GLIBC_ENV:=             PATH='${TARGET_PATH}' \
                        BUILD_CC=${CC_FOR_BUILD} \
                        CFLAGS="$(GLIBC_FLAGS)" \
                        CXXFLAGS="$(GLIBC_FLAGS)" \
                        CC="${TARGET_CC}" \
                        CXX="${TARGET_CXX}" \
                        AR="${TARGET_AR}" \
                        RANLIB="${TARGET_RANLIB}" \
                        libc_cv_forced_unwind=yes \
                        libc_cv_c_cleanup=yes \
                        libc_cv_gnu99_inline=yes \
			libc_cv_initfini_array=yes

GLIBC_MAKEOPTS+=	cross-compiling=yes
ifeq (${ADK_MAKE_PARALLEL},y)
GLIBC_MAKEOPTS+=	PARALLELMFLAGS="-j$(ADK_MAKE_JOBS)"
endif


GLIBC_BUILD_DIR_FINAL:=		${WRKDIR}/$(PKG_NAME)-$(PKG_VERSION)-final

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
	touch $(STAGING_TARGET_DIR)/usr/include/gnu/stubs.h
	touch $(STAGING_TARGET_DIR)/usr/include/gnu/stubs-{32,x32,64,soft,hard}.h
	mkdir -p ${STAGING_TARGET_DIR}/etc
	${INSTALL_DATA} ${WRKBUILD}/posix/gai.conf ${STAGING_TARGET_DIR}/etc
	${INSTALL_DATA} ${WRKBUILD}/nss/nsswitch.conf ${STAGING_TARGET_DIR}/etc
	touch $@

include ${ADK_TOPDIR}/mk/toolchain.mk
