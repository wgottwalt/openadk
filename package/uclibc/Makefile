# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include $(TOPDIR)/toolchain/uClibc/Makefile.inc

NO_DISTFILES:=1

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,UCLIBC,uclibc,$(PKG_VERSION)-$(PKG_RELEASE)))

# do nothing, uClibc is already build in toolchain directory
do-install:
	${INSTALL_DIR} $(IDIR_UCLIBC)/lib $(IDIR_UCLIBC)/etc
	# create timezone file
	echo 'CET-1CEST-2,M3.5.0/02:00:00,M10.5.0/03:00:00' > $(IDIR_UCLIBC)/etc/TZ
ifneq (${CPU_ARCH},x86_64)
	$(CP) $(STAGING_DIR)/lib/libgcc_s.so.* $(IDIR_UCLIBC)/lib/
endif
	$(CP) $(STAGING_DIR)/lib/libc.so.* $(IDIR_UCLIBC)/lib/
	$(CP) $(STAGING_DIR)/lib/libuClibc-$(PKG_VERSION).so $(IDIR_UCLIBC)/lib/
	$(CP) $(STAGING_DIR)/lib/ld*-uClibc-$(PKG_VERSION).so $(IDIR_UCLIBC)/lib/
	$(CP) $(STAGING_DIR)/lib/ld*-uClibc.so.* $(IDIR_UCLIBC)/lib/
	-for file in libcrypt libdl libm libnsl libresolv librt libutil; do \
		$(CP) $(STAGING_DIR)/lib/$$file.so.* $(IDIR_UCLIBC)/lib/; \
		$(CP) $(STAGING_DIR)/lib/$$file-$(PKG_VERSION).so $(IDIR_UCLIBC)/lib/; \
	done
	# create links for ldd / gcc
ifneq (${CPU_ARCH},x86_64)
	cd $(IDIR_UCLIBC)/lib && ln -sf ld-uClibc.so.0 ld.so
else
	cd $(IDIR_UCLIBC)/lib && ln -sf ld64-uClibc.so.0 ld.so
endif
	cd $(IDIR_UCLIBC)/lib && ln -sf libc.so.0 libc.so
	cd $(IDIR_UCLIBC)/lib && ln -sf libgcc_s.so.1 libgcc_s.so

include ${TOPDIR}/mk/pkg-bottom.mk
