# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libcapi20
PKG_VERSION:=		3.0.5-cm
PKG_RELEASE:=		1
PKG_MD5SUM:=		230fce089ea094742021f90e4884ce8a
PKG_DESCR:=		CAPI library
PKG_SECTION:=		libs
PKG_SITES:=		ftp://ftp.melware.net/capi-utils/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBCAPI20,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

post-install:
	$(INSTALL_DIR) $(IDIR_LIBCAPI20)/usr/lib
	${CP} ${WRKINST}/usr/lib/libcapi20.so* ${IDIR_LIBCAPI20}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
