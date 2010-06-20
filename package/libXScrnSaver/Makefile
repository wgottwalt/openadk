# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libXScrnSaver
PKG_VERSION:=		1.2.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		72ca7f37e4a1794acbdd9ab047821e8b
PKG_DESCR:=		X.Org XScrnSaver library
PKG_SECTION:=		libs
PKG_BUILDDEP:=		scrnsaverproto
PKG_URL:=		http://xorg.freedesktop.org/
PKG_SITES:=		${MASTER_SITE_XORG}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBXSCRNSAVER,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--enable-malloc0returnsnull

post-install:
	$(INSTALL_DIR) $(IDIR_LIBXSCRNSAVER)/usr/lib
	${CP} $(WRKINST)/usr/lib/libXss.so* \
		$(IDIR_LIBXSCRNSAVER)/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
