# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libc
PKG_VERSION:=		1.0
PKG_RELEASE:=		2
PKG_SECTION:=		base
PKG_DESCR:=		native C library
NO_DISTFILES:=		1

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBC,libc,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

# do nothing, use native c library
do-install:
	${INSTALL_DIR} $(IDIR_LIBC)/lib
	$(CP) /lib/libgcc_s.so* $(IDIR_LIBC)/lib/
	$(CP) /lib/ld*-*.so* $(IDIR_LIBC)/lib/
	if test -f /lib/libuClibc-*.so; then $(CP) /lib/libuClibc-*.so \
		$(IDIR_LIBC)/lib/;fi
	-for file in libc libpthread libcrypt libdl libm libnsl libresolv librt libutil libnss_compat libnss_dns libnss_files; do \
		$(CP) /lib/$$file.so.* $(IDIR_LIBC)/lib/; \
		$(CP) /lib/$$file-*.so $(IDIR_LIBC)/lib/; \
	done
	# create ld.so link for ldd
	cd $(IDIR_LIBC)/lib && ln -sf ld-linux.so.2 ld.so

include ${TOPDIR}/mk/pkg-bottom.mk
