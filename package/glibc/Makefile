# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include $(TOPDIR)/toolchain/glibc/Makefile.inc

PKG_DESCR:=		GNU C library
PKG_SECTION:=		base
NO_DISTFILES:=		1
PKG_OPTS:=		noremove

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,GLIBC,glibc,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

do-extract:

# do nothing, glibc is already build in toolchain directory
do-install:
	${INSTALL_DIR} $(IDIR_GLIBC)/lib $(IDIR_GLIBC)/etc
	# install /etc/localtime from host system (FIXME)
	${CP} /etc/localtime $(IDIR_GLIBC)/etc
ifeq ($(ADK_SSP),y)
	$(CP) $(STAGING_DIR)/lib/libssp.so* $(IDIR_GLIBC)/lib/
endif
	$(CP) $(STAGING_DIR)/lib/libgcc_s.so.* $(IDIR_GLIBC)/lib/
	$(CP) $(STAGING_DIR)/lib/ld-*.so* $(IDIR_GLIBC)/lib/
	-for file in libc libcrypt libdl libm libresolv librt libutil libnss_compat libnss_dns libnss_files; do \
		$(CP) $(STAGING_DIR)/lib/$$file.so.* $(IDIR_GLIBC)/lib/; \
		$(CP) $(STAGING_DIR)/lib/$$file-$(PKG_VERSION).so $(IDIR_GLIBC)/lib/; \
	done
	# create ld.so link for mips gcc linker option
	cd $(IDIR_GLIBC)/lib && ln -sf ld-linux.so.2 ld.so.1
	cd $(IDIR_GLIBC)/lib && ln -sf libgcc_s.so.1 libgcc_s.so
	# header package
	${INSTALL_DIR} $(IDIR_GLIBC_DEV)/usr/include/{sys,bits,linux,asm,asm-generic}
	for file in \
		regex errno limits alloca stdint locale ctype \
		stdlib string sgidefs fcntl \
		libintl sched pthread wchar _G_config getopt endian \
		features libio stdio error signal time unistd \
	;do \
		${CP} $(STAGING_DIR)/usr/include/$$file.h \
		$(IDIR_GLIBC_DEV)/usr/include; \
	done
	${CP} $(STAGING_DIR)/usr/include/asm/*.h $(IDIR_GLIBC_DEV)/usr/include/asm
	${CP} $(STAGING_DIR)/usr/include/asm-generic/*.h $(IDIR_GLIBC_DEV)/usr/include/asm-generic
	${CP} $(STAGING_DIR)/usr/include/sys/*.h $(IDIR_GLIBC_DEV)/usr/include/sys
	${CP} $(STAGING_DIR)/usr/include/bits/*.h $(IDIR_GLIBC_DEV)/usr/include/bits
	${CP} $(STAGING_DIR)/usr/include/linux/*.h $(IDIR_GLIBC_DEV)/usr/include/linux

include ${TOPDIR}/mk/pkg-bottom.mk
