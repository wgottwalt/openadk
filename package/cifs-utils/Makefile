# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		cifs-utils
PKG_VERSION:=		6.3
PKG_RELEASE:=		1
PKG_MD5SUM:=		93697dbc043cb4d5c66e15e281f872e5
PKG_DESCR:=		network filesystem utilities
PKG_SECTION:=		net/fs
PKG_BUILDDEP:=		autotool
PKG_URL:=		https://wiki.samba.org/index.php/LinuxCIFS_utils
PKG_SITES:=		ftp://ftp.samba.org/pub/linux-cifs/cifs-utils/

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(TOPDIR)/mk/package.mk

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

include ${TOPDIR}/mk/pkg-bottom.mk
