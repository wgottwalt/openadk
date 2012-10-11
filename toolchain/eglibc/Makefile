# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include ../rules.mk
include Makefile.inc
include Makefile.multilib
include ${TOPDIR}/mk/buildhlp.mk

ifneq ($(ADK_DEBUG),)
TARGET_CFLAGS+=		-O2
endif
# ssp partially supported
TARGET_CFLAGS:= 	$(filter-out -fstack-protector,$(TARGET_CFLAGS))

ifeq ($(ADK_TARGET_NO_FPU),y)
EGLIBC_CONFOPTS+=       --without-fp
endif

EGLIBC_BUILD_DIR_INITIAL:=	${WRKDIR}/$(PKG_NAME)-$(PKG_VERSION)-headers
EGLIBC_BUILD_DIR_FINAL:=	${WRKDIR}/$(PKG_NAME)-$(PKG_VERSION)-final

ifeq ($(ADK_TARGET_WITH_MULTILIB),y)
$(WRKBUILD)/.headers_configure: 
	for abi in $(TABI); do \
		mkdir -p $(EGLIBC_BUILD_DIR_INITIAL)-$${abi/*:/}; \
		(cd ${WRKDIR}/$(PKG_NAME)-$(PKG_VERSION); \
			ln -sf ../ports ${WRKDIR}/$(PKG_NAME)-$(PKG_VERSION)/libc); \
		$(CP) ${TOPDIR}/toolchain/eglibc/eglibc.config \
			$(EGLIBC_BUILD_DIR_INITIAL)-$${abi/*:/}/option-groups.config; \
		(cd $(EGLIBC_BUILD_DIR_INITIAL)-$${abi/*:/}; \
			${EGLIBC_ENV} \
			CC="${REAL_GNU_TARGET_NAME}-gcc ${TCFLAGS}$${abi/*:/}" \
			$(WRKBUILD)/libc/configure \
				--prefix=$(STAGING_TARGET_DIR)-$${abi/*:/}/usr \
				--with-headers=$(STAGING_TARGET_DIR)-$${abi/*:/}/usr/include \
				--host=$${abi/:*/} \
				${EGLIBC_CONFOPTS} \
		); \
	done
	touch $@

$(WRKBUILD)/.headers: $(WRKBUILD)/.headers_configure
	for abi in $(TABI); do \
		(cd $(EGLIBC_BUILD_DIR_INITIAL)-$${abi/*:/}; \
			${EGLIBC_ENV} \
			CC="${REAL_GNU_TARGET_NAME}-gcc ${TCFLAGS}$${abi/*:/}" \
			$(MAKE) install-headers install-bootstrap-headers=yes cross-compiling=yes \
		); \
		touch $(STAGING_TARGET_DIR)-$${abi/*:/}/usr/include/gnu/stubs.h; \
		touch $(STAGING_TARGET_DIR)-$${abi/*:/}/usr/include/gnu/stubs-{32,x32,64}.h; \
	done
	touch $@
else
$(WRKBUILD)/.headers_configure:
	mkdir -p $(EGLIBC_BUILD_DIR_INITIAL)
	(cd ${WRKDIR}/$(PKG_NAME)-$(PKG_VERSION); \
		ln -sf ../ports ${WRKDIR}/$(PKG_NAME)-$(PKG_VERSION)/libc);
	$(CP) ${TOPDIR}/toolchain/eglibc/eglibc.config \
		$(EGLIBC_BUILD_DIR_INITIAL)/option-groups.config
	(cd $(EGLIBC_BUILD_DIR_INITIAL); \
		${EGLIBC_ENV} \
		CC="${REAL_GNU_TARGET_NAME}-gcc $(ADK_TARGET_ABI_CFLAGS)" \
		$(WRKBUILD)/libc/configure \
			--prefix=$(STAGING_TARGET_DIR)/usr \
			--with-headers=$(STAGING_TARGET_DIR)/usr/include \
			--host=$(REAL_GNU_TARGET_NAME) \
			${EGLIBC_CONFOPTS} \
	);
	touch $@

$(WRKBUILD)/.headers: $(WRKBUILD)/.headers_configure
	(cd $(EGLIBC_BUILD_DIR_INITIAL); \
		${EGLIBC_ENV} \
		CC="${REAL_GNU_TARGET_NAME}-gcc $(ADK_TARGET_ABI_CFLAGS)" \
		$(MAKE) install-headers install-bootstrap-headers=yes cross-compiling=yes \
	);
	touch $(STAGING_TARGET_DIR)/usr/include/gnu/stubs.h
	touch $(STAGING_TARGET_DIR)/usr/include/gnu/stubs-{32,x32,64}.h
	touch $@
endif

ifeq ($(ADK_TOOLCHAIN_GCC_USE_SSP),y)
EGLIBC_ENV+=		libc_cv_ssp=yes
else
EGLIBC_ENV+=		libc_cv_ssp=no
endif

ifeq ($(ADK_TARGET_WITH_MULTILIB),y)
$(WRKBUILD)/.configured:
	for abi in $(TABI); do \
		mkdir -p $(EGLIBC_BUILD_DIR_FINAL)-$${abi/*:/} ;\
		$(CP) ${TOPDIR}/toolchain/eglibc/eglibc.config \
			$(EGLIBC_BUILD_DIR_FINAL)-$${abi/*:/}/option-groups.config ;\
		(cd $(EGLIBC_BUILD_DIR_FINAL)-$${abi/*:/}; \
			${EGLIBC_ENV} \
			CC="${REAL_GNU_TARGET_NAME}-gcc ${TCFLAGS}$${abi/*:/}" \
			$(WRKBUILD)/libc/configure \
				--prefix=/usr \
				--enable-shared \
				--enable-stackguard-randomization \
				--host=$${abi/:*/} \
				${EGLIBC_CONFOPTS} \
		); \
	done
	touch $@

$(WRKBUILD)/.compiled: $(WRKBUILD)/.configured
	for abi in $(TABI); do \
		${EGLIBC_ENV} $(MAKE) -C $(EGLIBC_BUILD_DIR_FINAL)-$${abi/*:/} cross-compiling=yes all ;\
	done
	touch $@

$(WRKBUILD)/.installed: $(WRKBUILD)/.compiled
	for abi in $(TABI); do \
		${EGLIBC_ENV} $(MAKE) -C $(EGLIBC_BUILD_DIR_FINAL)-$${abi/*:/} install_root=$(STAGING_TARGET_DIR)-$${abi/*:/} install ;\
	done
	# default libgcc searching for 64 bit libraries
	${EGLIBC_ENV} $(MAKE) -C $(EGLIBC_BUILD_DIR_FINAL)-64 install_root=$(STAGING_TARGET_DIR) install
	touch $(STAGING_TARGET_DIR)/usr/include/gnu/stubs.h
	touch $(STAGING_TARGET_DIR)/usr/include/gnu/stubs-{32,x32,64}.h
	for abi in $(TABI); do \
		mkdir -p $(STAGING_TARGET_DIR)/lib/$(REAL_GNU_TARGET_NAME)/4.7.2/$${abi/*:/} ; \
		$(CP) $(STAGING_TARGET_DIR)-$${abi/*:/}/lib/* $(STAGING_TARGET_DIR)-$${abi/*:/}/usr/lib/* \
			$(STAGING_TARGET_DIR)/lib/$(REAL_GNU_TARGET_NAME)/4.7.2/$${abi/*:/} ; \
		rm $(STAGING_TARGET_DIR)/lib/$(REAL_GNU_TARGET_NAME)/4.7.2/$${abi/*:/}/libc.so ; \
	done
	${INSTALL_DIR} ${STAGING_TARGET_DIR}/etc
	${INSTALL_DATA} ${WRKBUILD}/libc/posix/gai.conf ${STAGING_TARGET_DIR}/etc/
	${INSTALL_DATA} ${WRKBUILD}/libc/nscd/nscd.conf ${STAGING_TARGET_DIR}/etc/
	${INSTALL_DATA} ${WRKBUILD}/libc/nss/nsswitch.conf ${STAGING_TARGET_DIR}/etc/
	touch $@
else
$(WRKBUILD)/.configured:
	mkdir -p $(EGLIBC_BUILD_DIR_FINAL)
	$(CP) ${TOPDIR}/toolchain/eglibc/eglibc.config \
		$(EGLIBC_BUILD_DIR_FINAL)/option-groups.config
	(cd $(EGLIBC_BUILD_DIR_FINAL); \
		${EGLIBC_ENV} \
		CC="${REAL_GNU_TARGET_NAME}-gcc $(ADK_TARGET_ABI_CFLAGS)" \
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
	${EGLIBC_ENV} \
	CC="${REAL_GNU_TARGET_NAME}-gcc $(ADK_TARGET_ABI_CFLAGS)" \
		$(MAKE) -C $(EGLIBC_BUILD_DIR_FINAL) cross-compiling=yes all
	touch $@

$(WRKBUILD)/.installed: $(EGLIBC_BUILD_DIR_FINAL)/libc.so
	${EGLIBC_ENV} \
	CC="${REAL_GNU_TARGET_NAME}-gcc $(ADK_TARGET_ABI_CFLAGS)" \
		$(MAKE) -C $(EGLIBC_BUILD_DIR_FINAL) install_root=$(STAGING_TARGET_DIR) install
	${INSTALL_DIR} ${STAGING_TARGET_DIR}/etc
	${INSTALL_DATA} ${WRKBUILD}/libc/posix/gai.conf ${STAGING_TARGET_DIR}/etc/
	${INSTALL_DATA} ${WRKBUILD}/libc/nscd/nscd.conf ${STAGING_TARGET_DIR}/etc/
	${INSTALL_DATA} ${WRKBUILD}/libc/nss/nsswitch.conf ${STAGING_TARGET_DIR}/etc/
	touch $@
endif

$(WRKBUILD)/.fixup:
ifeq ($(ADK_TARGET_WITH_MULTILIB),y)
ifeq ($(ADK_TARGET_ABI_64),y)
	${CP} $(STAGING_TARGET_DIR)-64/lib/* $(STAGING_TARGET_DIR)/lib
	${CP} $(STAGING_TARGET_DIR)-64/usr/lib/* $(STAGING_TARGET_DIR)/usr/lib
endif
ifeq ($(ADK_TARGET_ABI_32),y)
	${CP} $(STAGING_TARGET_DIR)-32/lib/* $(STAGING_TARGET_DIR)/lib
	${CP} $(STAGING_TARGET_DIR)-32/usr/lib/* $(STAGING_TARGET_DIR)/usr/lib
endif
ifeq ($(ADK_TARGET_ABI_X32),y)
	${CP} $(STAGING_TARGET_DIR)-x32/lib/* $(STAGING_TARGET_DIR)/lib
	${CP} $(STAGING_TARGET_DIR)-x32/usr/lib/* $(STAGING_TARGET_DIR)/usr/lib
endif
endif
	touch $@

include ${TOPDIR}/mk/toolchain.mk
