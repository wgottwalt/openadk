# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		radvd
PKG_VERSION:=		2.12
PKG_RELEASE:=		1
PKG_HASH:=		b070e77238e789e298a82cba2b1bfb0b0180b4ebc1adfc4e75058adfdbff747b
PKG_DESCR:=		routing advertisement daemon for ipv6
PKG_SECTION:=		net/ipv6
PKG_DEPENDS:=		libdaemon
PKG_KDEPENDS:=		ipv6
PKG_BUILDDEP:=		libdaemon check
PKG_URL:=		http://www.litech.org/radvd/
PKG_SITES:=		http://v6web.litech.org/radvd/dist/

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,RADVD,radvd,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

AUTOTOOL_STYLE:=	autoreconf
CONFIGURE_ARGS+=	--with-configfile=/etc/radvd.conf \
			--with-logfile=/var/log/radvd.log \
			--with-pidfile=/var/run/radvd.pid

radvd-install:
	$(INSTALL_DIR) $(IDIR_RADVD)/etc $(IDIR_RADVD)/usr/sbin
	$(INSTALL_DATA) ./files/radvd.conf $(IDIR_RADVD)/etc/
	$(INSTALL_BIN) $(WRKINST)/usr/sbin/radvd $(IDIR_RADVD)/usr/sbin/
	$(INSTALL_BIN) $(WRKINST)/usr/sbin/radvdump $(IDIR_RADVD)/usr/sbin/

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
