# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

# always use tab spaces as separator, no spaces
PKG_NAME:=		knxd
PKG_VERSION:=		v0.14
PKG_RELEASE:=		1
PKG_GIT:=		branch
PKG_DESCR:=		KNX daemon
PKG_SECTION:=		sys/hw
PKG_DEPENDS:=		libev
PKG_BUILDDEP:=		libev cmake-host
PKG_URL:=		https://github.com/knxd/knxd
PKG_SITES:=		https://github.com/knxd/knxd.git

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,KNXD,knxd,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

AUTOTOOL_STYLE:=	bootstrap

CONFIGURE_ARGS+=	--disable-systemd --disable-usb

knxd-install:
	$(INSTALL_DIR) $(IDIR_KNXD)/usr/bin
	$(INSTALL_DIR) $(IDIR_KNXD)/usr/lib
	$(INSTALL_DIR) $(IDIR_KNXD)/usr/share
	$(INSTALL_BIN) $(WRKINST)/usr/bin/knxd \
		$(IDIR_KNXD)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/knxtool \
		$(IDIR_KNXD)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/libexec/knxd_args \
		$(IDIR_KNXD)/usr/bin
	$(CP) $(WRKINST)/usr/lib/libeib*.so* \
		$(IDIR_KNXD)/usr/lib
	$(CP) $(WRKINST)/usr/libexec/knxd/* \
		$(IDIR_KNXD)/usr/bin
	$(CP) $(WRKINST)/usr/share/* \
		$(IDIR_KNXD)/usr/share


include $(ADK_TOPDIR)/mk/pkg-bottom.mk
