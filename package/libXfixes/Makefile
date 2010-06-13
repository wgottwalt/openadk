# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libXfixes
PKG_VERSION:=		4.0.4
PKG_RELEASE:=		1
PKG_MD5SUM:=		86eb4b916cd5948c0e20d279107b3331
PKG_DESCR:=		X Fixes Library
PKG_SECTION:=		libs
PKG_BUILDDEP+=		fixesproto
PKG_URL:=		http://xorg.freedesktop.org
PKG_SITES:=		http://xorg.freedesktop.org/archive/individual/lib/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBXFIXES,libxfixes,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

post-install:
	$(INSTALL_DIR) $(IDIR_LIBXFIXES)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libXfixes*.so* \
		$(IDIR_LIBXFIXES)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
