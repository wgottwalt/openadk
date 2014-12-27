# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		xlsfonts
PKG_VERSION:=		1.0.2
PKG_RELEASE:=		1
PKG_HASH:=		0d34e610bcd87fe0fc5e84982da8bd23d10b003c7d4660c83215a440efcf18c2
PKG_DESCR:=		list x11 fonts
PKG_SECTION:=		x11/utils
PKG_URL:=		http://www.x.org/
PKG_SITES:=		http://xorg.freedesktop.org/releases/individual/app/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,XLSFONTS,xlsfonts,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

xlsfonts-install:
	${INSTALL_DIR} ${IDIR_XLSFONTS}/usr/bin
	${CP} ${WRKINST}/usr/bin/xlsfonts \
		${IDIR_XLSFONTS}/usr/bin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
