# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libesmtp
PKG_VERSION:=		1.0.6
PKG_RELEASE:=		2
PKG_HASH:=		d0a61a5c52d99fa7ce7d00ed0a07e341dbda67101dbed1ab0cdae3f37db4eb0b
PKG_DESCR:=		implements the client side of the smtp protocol
PKG_SECTION:=		libs/net
PKG_URL:=		http://www.stafford.uklinux.net/libesmtp/
PKG_SITES:=		http://www.stafford.uklinux.net/libesmtp/
PKG_OPTS:=		dev

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

PKG_CHOICES_LIBESMTP:=	WITH_LIBRESSL WITHOUT_SSL
PKGCD_WITH_LIBRESSL:=	use libressl for crypto
PKGCB_WITH_LIBRESSL:=	libressl
PKGCS_WITH_LIBRESSL:=	libressl
PKGCD_WITHOUT_SSL:=	use no ssl

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBESMTP,libesmtp,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

AUTOTOOL_STYLE:=	autoreconf

ifeq (${ADK_PACKAGE_LIBESMTP_WITH_LIBRESSL},y)
CONFIGURE_ARGS+=	--with-openssl
endif
ifeq (${ADK_PACKAGE_LIBESMTP_WITHOUT_SSL},y)
CONFIGURE_ARGS+=	--without-openssl
endif

libesmtp-install:
	$(INSTALL_DIR) $(IDIR_LIBESMTP)/usr/lib/esmtp-plugins
	$(CP) $(WRKINST)/usr/lib/libesmtp.so* $(IDIR_LIBESMTP)/usr/lib/
	$(CP) $(WRKINST)/usr/lib/esmtp-plugins/*.so \
		$(IDIR_LIBESMTP)/usr/lib/esmtp-plugins/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
