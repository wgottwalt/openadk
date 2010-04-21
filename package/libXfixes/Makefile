# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libXfixes
PKG_VERSION:=		4.0.4
PKG_RELEASE:=		1
PKG_MD5SUM:=		86eb4b916cd5948c0e20d279107b3331
PKG_DESCR:=		add short description
PKG_SECTION:=		libs
PKG_URL:=		add project url
PKG_SITES:=		http://xorg.freedesktop.org/archive/individual/lib/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBXFIXES,libxfixes,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

post-install:
	$(INSTALL_DIR) $(IDIR_LIBXFIXES)/usr/lib
	$(INSTALL_BIN) $(WRKINST)/usr/lib/libXfixes*.so* \
		$(IDIR_LIBXFIXES)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
