# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		imlib2
PKG_VERSION:=		1.4.4
PKG_RELEASE:=		1
PKG_MD5SUM:=		20d59c7cda06742015baade6f5975415
PKG_DESCR:=		Version 2 of an advanced replacement library for libraries like libXpm
PKG_SECTION:=		libs
PKG_DEPENDS:=		libfreetype
PKG_BUILDDEP:=		libfreetype
PKG_URL:=		http://www.enlightenment.org/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=enlightenment/}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,IMLIB2,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

post-install:
	$(INSTALL_DIR) $(IDIR_IMLIB2)/usr/lib/imlib2/{filters,loaders}
	${CP} $(WRKINST)/usr/lib/libImlib2.so* $(IDIR_IMLIB2)/usr/lib
	${CP} $(WRKINST)/usr/lib/imlib2/filters/*.so \
		$(IDIR_IMLIB2)/usr/lib/imlib2/filters/
	${CP} $(WRKINST)/usr/lib/imlib2/loaders/*.so \
		$(IDIR_IMLIB2)/usr/lib/imlib2/loaders/

include ${TOPDIR}/mk/pkg-bottom.mk
