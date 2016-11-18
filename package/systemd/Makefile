# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		systemd
PKG_VERSION:=		232
PKG_RELEASE:=		1
PKG_HASH:=		1172c7c7d5d72fbded53186e7599d5272231f04cc8b72f9a0fb2c5c20dfc4880
PKG_DESCR:=		system and service manager
PKG_SECTION:=		base/apps
PKG_DEPENDS:=		libcap libmount
PKG_BUILDDEP:=		intltool-host gperf-host libcap util-linux gettext-host
PKG_URL:=		https://wiki.freedesktop.org/www/Software/systemd/
PKG_SITES:=		https://github.com/systemd/systemd/archive/

PKG_LIBC_DEPENDS:=	glibc

DISTFILES:=             v$(PKG_VERSION).tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,SYSTEMD,systemd,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

AUTOTOOL_STYLE:=	autogen
CONFIGURE_ARGS+=	--disable-static \
			--disable-manpages \
			--disable-selinux \
			--disable-pam \
			--disable-ima \
			--disable-libcryptsetup \
			--disable-efi \
			--disable-gnuefi \
			--disable-ldconfig \
			--disable-tests \
			--disable-coverage \
			--with-default-dnssec=no \
			--without-python \
			--disable-acl \
			--disable-audit \
			--disable-libidn \
			--disable-seccomp \
			--disable-xkbcommon \
			--disable-kdbus \
			--disable-localed \
			--disable-polkit \
			--disable-bzip2 \
			--disable-lz4 \
			--disable-xz \
			--disable-zlib \
			--disable-libcurl \
			--disable-gcrypt \
			--disable-microhttpd \
			--disable-qrencode \
			--disable-quotacheck \
			--disable-rfkill \
			--disable-smack \
			--disable-hibernate 

systemd-install:
	$(INSTALL_DIR) $(IDIR_SYSTEMD)/etc
	$(CP) $(WRKINST)/etc/* \
		$(IDIR_SYSTEMD)/etc
	$(INSTALL_DIR) $(IDIR_SYSTEMD)/usr/lib
	$(CP) $(WRKINST)/usr/lib/* \
		$(IDIR_SYSTEMD)/usr/lib
	$(INSTALL_DIR) $(IDIR_SYSTEMD)/usr/bin
	$(CP) $(WRKINST)/usr/bin/* \
		$(IDIR_SYSTEMD)/usr/bin
	$(INSTALL_DIR) $(IDIR_SYSTEMD)/usr/share
	$(CP) $(WRKINST)/usr/share/* \
		$(IDIR_SYSTEMD)/usr/share

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
