# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		iw
PKG_VERSION:=		3.15
PKG_RELEASE:=		1
PKG_MD5SUM:=		3b77ad7ec44a865a3bb2ab6c1c463bba
PKG_DESCR:=		tools for setting up wifi cards via netlink
PKG_SECTION:=		net/wifi
PKG_DEPENDS:=		libnl
PKG_BUILDDEP:=		libnl
PKG_URL:=		http://wireless.kernel.org/en/users/Documentation/iw
PKG_SITES:=		https://www.kernel.org/pub/software/network/iw/

PKG_DFLT_IW:=		y if ADK_TARGET_WITH_WIFI

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,IW,iw,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
TARGET_CFLAGS+=		$(TARGET_CPPFLAGS)

iw-install:
	${INSTALL_DIR} ${IDIR_IW}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/iw ${IDIR_IW}/usr/sbin

include ${TOPDIR}/mk/pkg-bottom.mk
