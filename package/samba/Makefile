# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		samba
PKG_VERSION:=		4.5.1
PKG_RELEASE:=		1
PKG_HASH:=		b0a703e069677ff3182e5da3a91e018db344e3b54e0a43ed43dbfd8eb7d3f085
PKG_DESCR:=		file and print server
PKG_SECTION:=		net/fs
PKG_DEPENDS:=		libuuid libpopt libgnutls libtirpc
PKG_BUILDDEP:=		gettext-tiny util-linux popt python2 gnutls
PKG_BUILDDEP+=		heimdal-host python2-host libtirpc
PKG_NEEDS:=		threads
PKG_URL:=		http://www.samba.org/
PKG_SITES:=		http://samba.org/samba/ftp/stable/

DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,SAMBA,samba,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

XAKE_ENV+=		V=1
CONFIG_STYLE:=		minimal
CONFIGURE_ARGS+=	--enable-fhs \
			--prefix=/usr \
			--sysconfdir=/etc \
			--localstatedir=/var \
			--with-privatedir=/etc/samba \
			--cross-compile \
			--cross-answers=$(WRKSRC)/cache.txt \
			--hostcc=gcc \
			--without-pie \
			--without-gettext \
			--without-relro \
			--without-systemd \
			--without-automount \
			--without-pam \
			--without-fam \
			--without-dmapi \
			--without-ads \
			--without-ldap \
			--without-acl-support \
			--disable-glusterfs \
			--disable-iprint \
			--disable-cups \
			--disable-avahi \
			--disable-rpath \
			--bundled-libraries='com_err,!asn1_compile,!compile_et' \
			--disable-rpath-install
CONFIGURE_ENV+=		PYTHON_CONFIG="$(STAGING_TARGET_DIR)/usr/bin/python-config" \
			python_LDFLAGS="" \
			python_LIBDIR=""

pre-configure:
	$(CP) ./files/cache.txt $(WRKSRC)
	echo 'Checking uname machine type: "$(ADK_TARGET_ARCH)"' >>$(WRKSRC)/cache.txt

samba-install:
	$(INSTALL_DIR) $(IDIR_SAMBA)/etc/samba
	$(INSTALL_DIR) $(IDIR_SAMBA)/usr/{sbin,bin,lib}
	$(INSTALL_DATA) ./files/smb.conf $(IDIR_SAMBA)/etc/samba
	$(INSTALL_BIN) $(WRKINST)/usr/sbin/{nmbd,smbd} \
		$(IDIR_SAMBA)/usr/sbin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/{smbpasswd,smbclient} \
		$(IDIR_SAMBA)/usr/bin
	$(CP) $(WRKINST)/usr/lib/lib*.so* \
		$(IDIR_SAMBA)/usr/lib
	$(CP) $(WRKINST)/usr/lib/samba \
		$(IDIR_SAMBA)/usr/lib

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
