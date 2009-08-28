# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include $(TOPDIR)/toolchain/eglibc/Makefile.inc

PKG_DESCR:=		embedded GNU C library
PKG_SECTION:=		base
NO_DISTFILES:=		1
PKG_OPTS:=		noremove

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,EGLIBC,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))
$(eval $(call PKG_template,EGLIBC_DEV,$(PKG_NAME)-dev,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

do-extract:

# do nothing, eglibc is already build in toolchain directory
do-install:
	${INSTALL_DIR} $(IDIR_EGLIBC)/lib $(IDIR_EGLIBC)/etc
	# install /etc/localtime from host system (FIXME)
	${CP} /etc/localtime $(IDIR_EGLIBC)/etc
ifeq ($(ADK_SSP),y)
	$(CP) $(STAGING_DIR)/lib/libssp.so* $(IDIR_EGLIBC)/lib/
endif
	$(CP) $(STAGING_DIR)/lib/libgcc_s.so.* $(IDIR_EGLIBC)/lib/
	-for file in libc ld libcrypt libdl libm libresolv librt libutil libnss_compat libnss_dns libnss_files; do \
		$(CP) $(STAGING_DIR)/lib/$$file.so.* $(IDIR_EGLIBC)/lib/; \
		$(CP) $(STAGING_DIR)/lib/$$file-$(PKG_VERSION).so $(IDIR_EGLIBC)/lib/; \
	done
	# create ld.so link for x86 linker and gcc
	cd $(IDIR_EGLIBC)/lib && ln -sf ld-$(PKG_VERSION).so ld-linux.so.2
	cd $(IDIR_EGLIBC)/lib && ln -sf libc.so.6 libc.so
	cd $(IDIR_EGLIBC)/lib && ln -sf libgcc_s.so.1 libgcc_s.so
	# header package
	${INSTALL_DIR} $(IDIR_EGLIBC_DEV)/usr/include/{sys,bits,gnu}
	for file in pthread sched wchar _G_config getopt endian features libio stdio error signal time unistd;do \
		${CP} $(STAGING_DIR)/usr/include/$$file.h \
		$(IDIR_EGLIBC_DEV)/usr/include; \
	done
	${CP} $(STAGING_DIR)/usr/include/sys/*.h $(IDIR_EGLIBC_DEV)/usr/include/sys
	${CP} $(STAGING_DIR)/usr/include/bits/*.h $(IDIR_EGLIBC_DEV)/usr/include/bits
	${CP} $(STAGING_DIR)/usr/include/gnu/*.h $(IDIR_EGLIBC_DEV)/usr/include/gnu

include ${TOPDIR}/mk/pkg-bottom.mk
