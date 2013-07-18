# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		cifs-utils
PKG_VERSION:=		6.0
PKG_RELEASE:=		2
PKG_MD5SUM:=		371e007a201be90c16497cd9bd5e2553
PKG_DESCR:=		CIFS utilities
PKG_SECTION:=		net/fs
PKG_DEPENDS:=		kmod-cifs
PKG_URL:=		https://wiki.samba.org/index.php/LinuxCIFS_utils
PKG_SITES:=		ftp://ftp.samba.org/pub/linux-cifs/cifs-utils/

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,CIFS_UTILS,cifs-utils,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--disable-cifsupcall \
			--disable-cifsidmap \
			--disable-cifsacl

cifs-utils-install:
	$(INSTALL_DIR) $(IDIR_CIFS_UTILS)/usr/sbin
	$(INSTALL_BIN) $(WRKINST)/sbin/mount.cifs \
		$(IDIR_CIFS_UTILS)/usr/sbin

include ${TOPDIR}/mk/pkg-bottom.mk
