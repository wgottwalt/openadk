# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libssh2
PKG_VERSION:=		1.4.3
PKG_RELEASE:=		1
PKG_MD5SUM:=		071004c60c5d6f90354ad1b701013a0b
PKG_DESCR:=		client-side C library implementing SSH2 protocol
PKG_SECTION:=		libs
PKG_URL:=		http://www.libssh2.org/
PKG_SITES:=		http://www.libssh2.org/download/
PKG_OPTS:=		dev

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBSSH2,libssh2,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

libssh2-install:
	$(INSTALL_DIR) $(IDIR_LIBSSH2)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libssh2*.so* \
		$(IDIR_LIBSSH2)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
