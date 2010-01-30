# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		parted
PKG_VERSION:=		1.9.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		055305bc7bcf472ce38f9abf69a9d94d
PKG_DESCR:=		GNU parted
PKG_SECTION:=		admin
PKG_DEPENDS:=		libuuid libreadline device-mapper
PKG_BUILDDEP+=		e2fsprogs lvm readline
PKG_URL:=		http://www.gnu.org/software/parted/index.shtml
PKG_SITES:=		${MASTER_SITE_GNU:=parted/}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,PARTED,${PKG_NAME},$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE:=	gnu
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} $(IDIR_PARTED)/usr/sbin $(IDIR_PARTED)/usr/lib
	${CP} $(WRKINST)/usr/lib/libparted*so* $(IDIR_PARTED)/usr/lib
	${INSTALL_BIN} $(WRKINST)/usr/sbin/parted $(IDIR_PARTED)/usr/sbin

include ${TOPDIR}/mk/pkg-bottom.mk
