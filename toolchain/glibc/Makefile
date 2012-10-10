# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include ../rules.mk

# glibc does not compile with Os
TARGET_CFLAGS:= $(subst Os,O2,$(TARGET_CFLAGS))
ifneq ($(ADK_DEBUG),)
TARGET_CFLAGS+=	-O2
endif

# ssp partially supported
TARGET_CFLAGS:=	$(filter-out -fstack-protector,$(TARGET_CFLAGS))
#TARGET_CFLAGS:=	$(filter-out -flto,$(TARGET_CFLAGS))

include Makefile.inc
include Makefile.multilib
include ${TOPDIR}/mk/buildhlp.mk

ifeq ($(ADK_TARGET_NO_FPU),y)
GLIBC_CONFOPTS+=	--without-fp
endif

GLIBC_MAKEOPTS+=	cross-compiling=yes
ifeq (${ADK_MAKE_PARALLEL},y)
GLIBC_MAKEOPTS+=	PARALLELMFLAGS="-j1"
endif

GLIBC_BUILD_DIR_INITIAL:=	${WRKDIR}/$(PKG_NAME)-$(PKG_VERSION)-headers
GLIBC_BUILD_DIR_FINAL:=		${WRKDIR}/$(PKG_NAME)-$(PKG_VERSION)-final

ifeq ($(ADK_TARGET_WITH_MULTILIB),y)
$(WRKBUILD)/.headers_configure: 
	for abi in $(TABI); do \
		mkdir -p $(GLIBC_BUILD_DIR_INITIAL)-$${abi/*:/}; \
		(cd ${WRKDIR}/$(PKG_NAME)-$(PKG_VERSION); \
			ln -sf ../../w-glibc-ports-$(PKG_VERSION)-1/glibc-ports-$(PKG_VERSION)/ ports); \
		(cd $(GLIBC_BUILD_DIR_INITIAL)-$${abi/*:/}; \
			${GLIBC_ENV} \
			CC="${REAL_GNU_TARGET_NAME}-gcc -m$${abi/*:/}" \
			$(WRKBUILD)/libc/configure \
				--prefix=$(STAGING_TARGET_DIR)-$${abi/*:/}/usr \
				--with-sysroot=$(STAGING_TARGET_DIR)-$${abi/*:/} \
				--host=$${abi/:*/} \
				${GLIBC_CONFOPTS} \
		); \
	done
	touch $@

$(WRKBUILD)/.headers: $(WRKBUILD)/.headers_configure
	for abi in $(TABI); do \
		(cd $(GLIBC_BUILD_DIR_INITIAL)-$${abi/*:/}; \
			${GLIBC_ENV} \
			CC="${REAL_GNU_TARGET_NAME}-gcc -m$${abi/*:/}" \
			$(MAKE) ${GLIBC_MAKEOPTS} install-headers \
		); \
	done
	touch $(STAGING_TARGET_DIR)/usr/include/gnu/stubs.h
	touch $(STAGING_TARGET_DIR)/usr/include/gnu/stubs-{32,x32,64}.h
	touch $@
else
$(WRKBUILD)/.headers_configure:
	mkdir -p $(GLIBC_BUILD_DIR_INITIAL)
	(cd ${WRKDIR}/$(PKG_NAME)-$(PKG_VERSION); \
	ln -sf ../../w-glibc-ports-$(PKG_VERSION)-1/glibc-ports-$(PKG_VERSION)/ ports);
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
	touch $(STAGING_TARGET_DIR)/usr/include/gnu/stubs-{32,x32,64}.h
	touch $@
endif

ifeq ($(ADK_TARGET_WITH_MULTILIB),y)
$(WRKBUILD)/.configured:
	for abi in $(TABI); do \
		mkdir -p $(GLIBC_BUILD_DIR_FINAL)-$${abi/*:/} ;\
		(cd $(GLIBC_BUILD_DIR_FINAL)-$${abi/*:/}; \
			${GLIBC_ENV} \
			CC="${REAL_GNU_TARGET_NAME}-gcc -m$${abi/*:/}" \
			$(WRKBUILD)/libc/configure \
				--prefix=/usr \
				--enable-shared \
				--enable-stackguard-randomization \
				--host=$${abi/:*/} \
				${GLIBC_CONFOPTS} \
		); \
	done
	touch $@

$(WRKBUILD)/.compiled: $(WRKBUILD)/.configured
	for abi in $(TABI); do \
		${GLIBC_ENV} $(MAKE) ${GLIBC_MAKEOPTS} -C $(GLIBC_BUILD_DIR_FINAL)-$${abi/*:/} all ;\
	done
	touch $@

$(WRKBUILD)/.installed: $(WRKBUILD)/.compiled
	for abi in $(TABI); do \
		${GLIBC_ENV} $(MAKE) -C $(GLIBC_BUILD_DIR_FINAL)-$${abi/*:/} install_root=$(STAGING_TARGET_DIR)-$${abi/*:/} install ;\
	done
	# default libgcc searching for 64 bit libraries
	${GLIBC_ENV} $(MAKE) -C $(GLIBC_BUILD_DIR_FINAL)-64 install_root=$(STAGING_TARGET_DIR) install
	touch $(STAGING_TARGET_DIR)/usr/include/gnu/stubs.h
	touch $(STAGING_TARGET_DIR)/usr/include/gnu/stubs-{32,x32,64}.h
	for abi in $(TABI); do \
		mkdir -p $(STAGING_TARGET_DIR)/lib/$(REAL_GNU_TARGET_NAME)/4.7.2/$${abi/*:/} ; \
		$(CP) $(STAGING_TARGET_DIR)-$${abi/*:/}/lib/* $(STAGING_TARGET_DIR)-$${abi/*:/}/usr/lib/* \
			$(STAGING_TARGET_DIR)/lib/$(REAL_GNU_TARGET_NAME)/4.7.2/$${abi/*:/} ; \
		rm $(STAGING_TARGET_DIR)/lib/$(REAL_GNU_TARGET_NAME)/4.7.2/$${abi/*:/}/libc.so ; \
	done
	mkdir -p ${STAGING_TARGET_DIR}/etc
	${INSTALL_DATA} ${WRKBUILD}/libc/posix/gai.conf ${STAGING_TARGET_DIR}/etc/
	${INSTALL_DATA} ${WRKBUILD}/libc/nscd/nscd.conf ${STAGING_TARGET_DIR}/etc/
	${INSTALL_DATA} ${WRKBUILD}/libc/nss/nsswitch.conf ${STAGING_TARGET_DIR}/etc/
	touch $@
else
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
endif

ifeq ($(ADK_TARGET_WITH_MULTILIB),y)
$(WRKBUILD)/.fixup:
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
	touch $@
endif

include ${TOPDIR}/mk/toolchain.mk
