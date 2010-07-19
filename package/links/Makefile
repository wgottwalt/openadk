# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		links
PKG_VERSION:=		2.2
PKG_RELEASE:=		1
PKG_BUILDDEP+=		openssl libpng jpeg gpm
PKG_MD5SUM:=		c9937f9ed0061f264973182f871fb667
PKG_DESCR:=		web browser with graphic support
PKG_SECTION:=		browser
PKG_DEPENDS:=		libpng libjpeg libtiff gpm libopenssl
PKG_URL:=		http://links.twibright.com
PKG_SITES:=		http://links.twibright.com/download/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LINKS,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--enable-graphics \
			--with-ssl \
			--without-svgalib \
			--without-x \
			--without-directfb \
			--without-pmshell \
			--without-atheos

post-install:
	${INSTALL_DIR} ${IDIR_LINKS}/usr/bin
	${CP} ${WRKINST}/usr/bin/* ${IDIR_LINKS}/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
