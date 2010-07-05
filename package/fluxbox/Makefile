# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		fluxbox
PKG_VERSION:=		1.1.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		e0be927617be4ffc1ddc79513f4eb0f9
PKG_DESCR:=		Fluxbox is an X11 window manager featuring tabs and an iconbar
PKG_SECTION:=		x11
PKG_DEPENDS:=		libstdcxx
PKG_BUILDDEP:=		libXpm
ifeq (${ADK_PACKAGE_FLUXBOX_WITH_IMLIB2},y)
PKG_BUILDDEP+=		imlib2
endif
PKG_URL:=		http://www.fluxbox.org
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=fluxbox/}

PKG_FLAVOURS:=		WITH_IMLIB2
PKGFD_WITH_IMLIB2:=	enable imlib2 support
PKGFS_WITH_IMLIB2:=	imlib2

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,FLUXBOX,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

ifeq (${ADK_PACKAGE_FLUXBOX_WITH_IMLIB2},y)
CONFIGURE_ARGS+=	--enable-imlib2
else
CONFIGURE_ARGS+=	--disable-imlib2
endif

post-install:
	$(INSTALL_DIR) $(IDIR_FLUXBOX)/usr/{bin,share}
	$(INSTALL_BIN) $(WRKINST)/usr/bin/* \
		$(IDIR_FLUXBOX)/usr/bin
	${CP} ${WRKINST}/usr/share/fluxbox ${IDIR_FLUXBOX}/usr/share/

include ${TOPDIR}/mk/pkg-bottom.mk
