# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include $(TOPDIR)/toolchain/uClibc/Makefile.inc

PKG_DESCR:=		embedded C library
PKG_SECTION:=		base
NO_DISTFILES:=		1
PKG_OPTS:=		noremove

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,UCLIBC,uclibc,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))
$(eval $(call PKG_template,UCLIBC_DEV,uclibc-dev,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

# do nothing, uClibc is already build in toolchain directory
do-install:
	${INSTALL_DIR} $(IDIR_UCLIBC)/lib $(IDIR_UCLIBC)/etc
	# create timezone file
	echo 'CET-1CEST-2,M3.5.0/02:00:00,M10.5.0/03:00:00' > $(IDIR_UCLIBC)/etc/TZ
	$(CP) $(STAGING_DIR)/lib/libgcc_s.so.* $(IDIR_UCLIBC)/lib/
	$(CP) $(STAGING_DIR)/lib/libc.so.* $(IDIR_UCLIBC)/lib/
	$(CP) $(STAGING_DIR)/lib/libuClibc-$(PKG_VERSION).so $(IDIR_UCLIBC)/lib/
	$(CP) $(STAGING_DIR)/lib/ld*-uClibc-$(PKG_VERSION).so $(IDIR_UCLIBC)/lib/
	$(CP) $(STAGING_DIR)/lib/ld*-uClibc.so.* $(IDIR_UCLIBC)/lib/
	-for file in libcrypt libdl libm libnsl libresolv librt libutil; do \
		$(CP) $(STAGING_DIR)/lib/$$file.so.* $(IDIR_UCLIBC)/lib/; \
		$(CP) $(STAGING_DIR)/lib/$$file-$(PKG_VERSION).so $(IDIR_UCLIBC)/lib/; \
	done
	# create links for ldd / gcc
	cd $(IDIR_UCLIBC)/lib && ln -sf ld-uClibc.so.0 ld.so
	cd $(IDIR_UCLIBC)/lib && ln -sf libc.so.0 libc.so
	cd $(IDIR_UCLIBC)/lib && ln -sf libgcc_s.so.1 libgcc_s.so
	# header package
	${INSTALL_DIR} $(IDIR_UCLIBC_DEV)/usr/include/{sys,bits}
	for file in alloca stdint locale ctype stdlib string sgidefs \
		libintl sched pthread wchar _G_config getopt endian \
		features libio stdio error signal time unistd;do \
			${CP} $(STAGING_DIR)/usr/include/$$file.h \
			$(IDIR_UCLIBC_DEV)/usr/include; \
	done
	${CP} $(STAGING_DIR)/usr/include/sys/*.h $(IDIR_UCLIBC_DEV)/usr/include/sys
	${CP} $(STAGING_DIR)/usr/include/bits/*.h $(IDIR_UCLIBC_DEV)/usr/include/bits

include ${TOPDIR}/mk/pkg-bottom.mk
