# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		parted
PKG_VERSION:=		3.1
PKG_RELEASE:=		3
PKG_MD5SUM:=		5d89d64d94bcfefa9ce8f59f4b81bdcb
PKG_DESCR:=		partition table editor
PKG_SECTION:=		sys/fs
PKG_DEPENDS:=		libblkid libuuid libreadline libpthread
PKG_BUILDDEP:=		util-linux readline
PKG_URL:=		http://www.gnu.org/software/parted/index.shtml
PKG_SITES:=		${MASTER_SITE_GNU:=parted/}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,PARTED,parted,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--disable-device-mapper

parted-install:
	${INSTALL_DIR} $(IDIR_PARTED)/usr/sbin $(IDIR_PARTED)/usr/lib
	${CP} $(WRKINST)/usr/lib/libparted*so* $(IDIR_PARTED)/usr/lib
	${INSTALL_BIN} $(WRKINST)/usr/sbin/parted $(IDIR_PARTED)/usr/sbin

include ${TOPDIR}/mk/pkg-bottom.mk
