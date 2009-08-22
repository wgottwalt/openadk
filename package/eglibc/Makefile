# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include $(TOPDIR)/toolchain/eglibc/Makefile.inc

PKG_DESCR:=		embedded GNU C library
PKG_SECTION:=		base
NO_DISTFILES:=		1

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,EGLIBC,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

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
	# create ld.so link for x86 linker 
	cd $(IDIR_EGLIBC)/lib && ln -sf ld-$(PKG_VERSION).so ld-linux.so.2

include ${TOPDIR}/mk/pkg-bottom.mk
