# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		fluxbox
PKG_VERSION:=		1.3.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		52e76de0ae96d8c5e87374661d0c7112
PKG_DESCR:=		X11 window manager featuring tabs and an iconbar
PKG_SECTION:=		x11/apps
PKG_DEPENDS:=		libstdcxx
PKG_BUILDDEP:=		libXpm libXft
PKG_URL:=		http://www.fluxbox.org/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=fluxbox/}

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_FLAVOURS_FLUXBOX:=	WITH_IMLIB2
PKGFD_WITH_IMLIB2:=	enable imlib2 support
PKGFS_WITH_IMLIB2:=	imlib2
PKGFB_WITH_IMLIB2:=	imlib2

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,FLUXBOX,fluxbox,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

ifeq (${ADK_PACKAGE_FLUXBOX_WITH_IMLIB2},y)
CONFIGURE_ARGS+=	--enable-imlib2
else
CONFIGURE_ARGS+=	--disable-imlib2
endif

fluxbox-install:
	$(INSTALL_DIR) $(IDIR_FLUXBOX)/usr/{bin,share}
	$(INSTALL_BIN) $(WRKINST)/usr/bin/* \
		$(IDIR_FLUXBOX)/usr/bin
	${CP} ${WRKINST}/usr/share/fluxbox ${IDIR_FLUXBOX}/usr/share/

include ${TOPDIR}/mk/pkg-bottom.mk
