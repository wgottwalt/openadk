# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libc
PKG_VERSION:=		1.0
PKG_RELEASE:=		1
NO_DISTFILES:=		1

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBC,libc,$(PKG_VERSION)-$(PKG_RELEASE)))

# do nothing, use native c library
do-install:
	${INSTALL_DIR} $(IDIR_LIBC)/lib $(IDIR_LIBC)/etc
	# install /etc/localtime from host system (FIXME)
	${CP} /etc/localtime $(IDIR_LIBC)/etc
	$(CP) /lib/libgcc_s.so.* $(IDIR_LIBC)/lib/
	$(CP) /lib/ld-*.so* $(IDIR_LIBC)/lib/
	-for file in libc libcrypt libdl libm libnsl libresolv librt libutil libnss_compat libnss_dns libnss_files; do \
		$(CP) /lib/$$file.so.* $(IDIR_LIBC)/lib/; \
		$(CP) /lib/$$file-*.so $(IDIR_LIBC)/lib/; \
	done
	# create ld.so link for ldd
	cd $(IDIR_LIBC)/lib && ln -sf ld-linux.so.2 ld.so

include ${TOPDIR}/mk/pkg-bottom.mk
