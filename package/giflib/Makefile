# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		giflib
PKG_VERSION:=		4.1.6
PKG_RELEASE:=		2
PKG_MD5SUM:=		4ff2ecec336b9724c5190f06e8a40f9e
PKG_DESCR:=		GIF graphics library
PKG_SECTION:=		libs
PKG_URL:=		http://sourceforge.net/projects/giflib/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=giflib/giflib%204.x/$(PKG_NAME)-$(PKG_VERSION)/}

PKG_SUBPKGS:=		GIFLIB GIFLIB_DEV
PKGSC_GIFLIB_DEV:=	devel

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,GIFLIB,giflib,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,GIFLIB_DEV,giflib-dev,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKGSC_GIFLIB_DEV}))

giflib-install:
	$(INSTALL_DIR) $(IDIR_GIFLIB)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libgif.so* \
		$(IDIR_GIFLIB)/usr/lib

giflib-dev-install:
	${INSTALL_DIR} ${IDIR_GIFLIB_DEV}/usr/include
	${CP} ${WRKINST}/usr/include/*.h ${IDIR_GIFLIB_DEV}/usr/include

include ${TOPDIR}/mk/pkg-bottom.mk
