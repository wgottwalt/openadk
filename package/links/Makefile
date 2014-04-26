# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		links
PKG_VERSION:=		2.7
PKG_RELEASE:=		1
PKG_MD5SUM:=		6b5ca02e180aed2f78ca2712f85e3ba5
PKG_DESCR:=		web browser with graphic support
PKG_SECTION:=		browser
PKG_DEPENDS:=		libpng libjpeg-turbo libtiff gpm libopenssl
PKG_BUILDDEP:=		openssl libpng libjpeg-turbo gpm
PKG_URL:=		http://links.twibright.com/
PKG_SITES:=		http://links.twibright.com/download/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_FLAVOURS_LINKS:=	WITH_DIRECTFB
PKGFD_WITH_DIRECTFB:=	enable DirectFB video output support
PKGFS_WITH_DIRECTFB:=	directfb
PKGFB_WITH_DIRECTFB:=	DirectFB

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LINKS,links,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--enable-graphics \
			--with-fb \
			--with-ssl \
			--without-svgalib \
			--without-libtiff \
			--without-x \
			--without-pmshell \
			--without-atheos

ifeq (${ADK_PACKAGE_LINKS_WITH_DIRECTFB},y)
CONFIGURE_ARGS+=	--with-directfb
else
CONFIGURE_ARGS+=	--without-directfb
endif

links-install:
	${INSTALL_DIR} ${IDIR_LINKS}/usr/bin
	${CP} ${WRKINST}/usr/bin/* ${IDIR_LINKS}/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
