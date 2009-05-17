# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include $(TOPDIR)/toolchain/glibc/Makefile.inc

NO_DISTFILES:=		1

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,GLIBC,glibc,$(PKG_VERSION)-$(PKG_RELEASE),$(ARCH)))

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
	-for file in libc libcrypt libdl libm libnsl libresolv librt libutil libnss_compat libnss_dns libnss_files; do \
		$(CP) $(STAGING_DIR)/lib/$$file.so.* $(IDIR_GLIBC)/lib/; \
		$(CP) $(STAGING_DIR)/lib/$$file-$(PKG_VERSION).so $(IDIR_GLIBC)/lib/; \
	done
	# create ld.so link for ldd
	cd $(IDIR_GLIBC)/lib && ln -sf ld-linux.so.2 ld.so

include ${TOPDIR}/mk/pkg-bottom.mk
