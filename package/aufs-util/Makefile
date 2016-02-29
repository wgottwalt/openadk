# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		aufs-util
# branch aufs4.0
PKG_VERSION:=		5e0c348bd8b1898beb1e043b026bcb0e0c7b0d54
PKG_GIT:=		hash
PKG_RELEASE:=		1
PKG_DESCR:=		aufs utilities (version 3 and above)
PKG_SECTION:=		sys/fs
PKG_URL:=		http://aufs.sf.net/
PKG_SITES:=		git://aufs.git.sourceforge.net/gitroot/aufs/aufs-util

PKG_SUBPKGS:=		AUFS_UTIL LIBAU
PKGSD_LIBAU:=		aufs userspace library
PKGSC_LIBAU:=		libs/misc

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,AUFS_UTIL,$(PKG_NAME),$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))
$(eval $(call PKG_template,LIBAU,libau,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKGSD_LIBAU),$(PKGSC_LIBAU)))

CONFIG_STYLE:=		manual
XAKE_FLAGS+=		Install=install \
			HOSTCC="$(HOST_CC)" \
			CPPFLAGS_FOR_BUILD="-I$(STAGING_TARGET_DIR)/usr/include -I./libau"

aufs-util-install:
	$(INSTALL_DIR) $(IDIR_AUFS_UTIL)/sbin
	$(INSTALL_BIN) $(WRKINST)/sbin/{{u,}mount.aufs,auplink} \
		$(IDIR_AUFS_UTIL)/sbin
	$(INSTALL_DIR) $(IDIR_AUFS_UTIL)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/au{brsync,chk} \
		$(IDIR_AUFS_UTIL)/usr/bin
	$(INSTALL_DIR) $(IDIR_AUFS_UTIL)/etc/default
	$(INSTALL_DATA) $(WRKINST)/etc/default/aufs \
		$(IDIR_AUFS_UTIL)/etc/default

libau-install:
	$(INSTALL_DIR) $(IDIR_LIBAU)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libau* $(IDIR_LIBAU)/usr/lib

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
