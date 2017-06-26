# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		xenomai
PKG_VERSION:=		3.0.5
PKG_RELEASE:=		1
PKG_HASH:=		84836a43b6a996dcdcb42b0b1653a3271cc201df2a2d42c1b4b3bafb2cca7c63
PKG_DESCR:=		realtime extension
PKG_SECTION:=		sys/misc
PKG_URL:=		https://xenomai.org/
PKG_SITES:=		https://xenomai.org/downloads/xenomai/stable/

DISTFILES:=             $(PKG_NAME)-$(PKG_VERSION).tar.bz2

PKG_CHOICES_XENOMAI:=	WITH_MERCURY
#PKG_CHOICES_XENOMAI:=	WITH_MERCURY WITH_COBALT
PKGCD_WITH_MERCURY:=	use mercury
#PKGCD_WITH_COBALT:=	use cobalt

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XENOMAI,xenomai,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

XAKE_FLAGS+=		SUDO="echo"
CONFIGURE_ARGS+=	--includedir=/usr/include/xenomai/ --disable-doc-install

ifeq (${ADK_PACKAGE_XENOMAI_WITH_MERCURY},y)
CONFIGURE_ARGS+=	--with-core=mercury
endif

ifeq (${ADK_PACKAGE_XENOMAI_WITH_COBALT},y)
CONFIGURE_ARGS+=	--with-core=cobalt
endif

xenomai-install:
	$(INSTALL_DIR) $(IDIR_XENOMAI)/usr/bin
	$(INSTALL_DIR) $(IDIR_XENOMAI)/usr/sbin
	$(INSTALL_DIR) $(IDIR_XENOMAI)/usr/lib
	$(CP) $(WRKINST)/usr/bin/* \
		$(IDIR_XENOMAI)/usr/bin
	$(CP) $(WRKINST)/usr/sbin/* \
		$(IDIR_XENOMAI)/usr/sbin
	$(CP) $(WRKINST)/usr/lib/* \
		$(IDIR_XENOMAI)/usr/lib


include $(ADK_TOPDIR)/mk/pkg-bottom.mk
