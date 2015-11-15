# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		iw
PKG_VERSION:=		4.1
PKG_RELEASE:=		1
PKG_HASH:=		5164aaacd8e82501d84a2187af194e8285a5a5b76e200447eb58d4dd78d1a34b
PKG_DESCR:=		tools for setting up wifi cards via netlink
PKG_SECTION:=		net/wifi
PKG_DEPENDS:=		libnl
PKG_BUILDDEP:=		libnl
PKG_NEEDS:=		threads
PKG_URL:=		http://wireless.kernel.org/en/users/Documentation/iw
PKG_SITES:=		https://www.kernel.org/pub/software/network/iw/

PKG_DFLT_IW:=		y if ADK_TARGET_WITH_WIFI

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,IW,iw,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TARGET_CFLAGS+=		$(TARGET_CPPFLAGS)
CONFIG_STYLE:=		manual

iw-install:
	${INSTALL_DIR} ${IDIR_IW}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/iw ${IDIR_IW}/usr/sbin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
