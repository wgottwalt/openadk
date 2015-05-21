# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		cifs-utils
PKG_VERSION:=		6.4
PKG_RELEASE:=		1
PKG_HASH:=		38fc63926af435dae4ebcf4406275580a692d9fb9ee3e32170317cf2ba68e6e3
PKG_DESCR:=		network filesystem utilities
PKG_SECTION:=		net/fs
PKG_URL:=		https://wiki.samba.org/index.php/LinuxCIFS_utils
PKG_SITES:=		https://ftp.samba.org/pub/linux-cifs/cifs-utils/

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,CIFS_UTILS,cifs-utils,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

AUTOTOOL_STYLE:=	autoreconf
CONFIGURE_ARGS+=	--disable-cifsupcall \
			--disable-cifsidmap \
			--disable-cifsacl \
			--disable-pie \
			--without-libcap \
			--disable-systemd

cifs-utils-install:
	$(INSTALL_DIR) $(IDIR_CIFS_UTILS)/sbin
	$(INSTALL_BIN) $(WRKINST)/sbin/mount.cifs \
		$(IDIR_CIFS_UTILS)/sbin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
