# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		sispmctl
PKG_VERSION:=		2.7
PKG_RELEASE:=		1
PKG_MD5SUM:=		2457f76cd129f880634f3381be0aeb76
PKG_DESCR:=		control application for power sockets
PKG_SECTION:=		sys/utils
PKG_DEPENDS:=		libusb libusb-compat
PKG_BUILDDEP:=		libusb libusb-compat
PKG_URL:=		http://sispmctl.sourceforge.net/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=sispmctl/}

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,SISPMCTL,sispmctl,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

sispmctl-install:
	${INSTALL_DIR} ${IDIR_SISPMCTL}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/sispmctl ${IDIR_SISPMCTL}/usr/bin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
