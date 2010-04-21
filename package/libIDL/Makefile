# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libIDL
PKG_VERSION:=		0.8.14
PKG_RELEASE:=		1
PKG_MD5SUM:=		531fbc1b40b80dd1d6f3b5e76b99067c
PKG_DESCR:=		libraries for Interface Definition Language files
PKG_SECTION:=		libs
PKG_URL:=		http://www.gnome.org
PKG_SITES:=		http://ftp.gnome.org/pub/GNOME/sources/libIDL/0.8/

include $(TOPDIR)/mk/package.mk

CONFIGURE_ENV+=		libIDL_cv_long_long_format=ll

$(eval $(call PKG_template,LIBIDL,libidl,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

post-install:
	$(INSTALL_DIR) $(IDIR_LIBIDL)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libIDL*.so* \
		$(IDIR_LIBIDL)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
