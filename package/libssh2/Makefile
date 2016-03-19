# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libssh2
PKG_VERSION:=		1.7.0
PKG_RELEASE:=		1
PKG_HASH:=		e4561fd43a50539a8c2ceb37841691baf03ecb7daf043766da1b112e4280d584
PKG_DESCR:=		client-side c library implementing ssh2 protocol
PKG_SECTION:=		libs/crypto
PKG_BUILDDEP:=		zlib
PKG_DEPENDS:=		zlib
PKG_URL:=		http://www.libssh2.org/
PKG_SITES:=		http://www.libssh2.org/download/
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_CHOICES_LIBSSH2:=	WITH_LIBRESSL WITH_OPENSSL
PKGCD_WITH_LIBRESSL:=	use libressl for crypto
PKGCB_WITH_LIBRESSL:=	libressl
PKGCS_WITH_LIBRESSL:=	libressl
PKGCD_WITH_OPENSSL:=	use openssl for crypto
PKGCB_WITH_OPENSSL:=	openssl
PKGCS_WITH_OPENSSL:=	libopenssl

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBSSH2,libssh2,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

libssh2-install:
	$(INSTALL_DIR) $(IDIR_LIBSSH2)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libssh2*.so* \
		$(IDIR_LIBSSH2)/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
