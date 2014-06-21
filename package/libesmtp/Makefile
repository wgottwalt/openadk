# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libesmtp
PKG_VERSION:=		1.0.6
PKG_RELEASE:=		2
PKG_MD5SUM:=		bf3915e627fd8f35524a8fdfeed979c8
PKG_DESCR:=		implements the client side of the smtp protocol
PKG_SECTION:=		libs/net
PKG_URL:=		http://www.stafford.uklinux.net/libesmtp/
PKG_SITES:=		http://www.stafford.uklinux.net/libesmtp/
PKG_OPTS:=		dev

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

PKG_FLAVOURS_LIBESMTP:=	WITH_SSL
PKGFD_WITH_SSL:=	enable ssl support
PKGFS_WITH_SSL:=	libopenssl
PKGFB_WITH_SSL:=	openssl

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBESMTP,libesmtp,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

AUTOTOOL_STYLE:=	autoreconf

ifneq (${ADK_PACKAGE_LIBESMTP_WITH_SSL},)
CONFIGURE_ARGS+=	--with-openssl
else
CONFIGURE_ARGS+=	--without-openssl
endif

libesmtp-install:
	$(INSTALL_DIR) $(IDIR_LIBESMTP)/usr/lib/esmtp-plugins
	$(CP) $(WRKINST)/usr/lib/libesmtp.so* $(IDIR_LIBESMTP)/usr/lib/
	$(CP) $(WRKINST)/usr/lib/esmtp-plugins/*.so \
		$(IDIR_LIBESMTP)/usr/lib/esmtp-plugins/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
