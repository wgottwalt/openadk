# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		cifs-utils
PKG_VERSION:=		6.1
PKG_RELEASE:=		6
PKG_MD5SUM:=		f83ef48ab1154aa74dd4cf1c1202bf04
PKG_DESCR:=		CIFS utilities
PKG_SECTION:=		net/fs
PKG_DEPENDS:=		kmod-cifs kmod-nls-utf8
PKG_BUILDDEP:=		autotool keyutils
PKG_URL:=		https://wiki.samba.org/index.php/LinuxCIFS_utils
PKG_SITES:=		ftp://ftp.samba.org/pub/linux-cifs/cifs-utils/

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,CIFS_UTILS,cifs-utils,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

ifeq ($(ADK_STATIC),y)
TARGET_LDFLAGS+=        -static
endif

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
