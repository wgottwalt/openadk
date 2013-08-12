# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libmodplug
PKG_VERSION:=		0.8.8.4
PKG_RELEASE:=		1
PKG_MD5SUM:=		fddc3c704c5489de2a3cf0fedfec59db
PKG_DESCR:=		a MOD player library
PKG_SECTION:=		libs
PKG_URL:=		http://modplug-xmms.sourceforge.net
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=modplug-xmms/libmodplug/0.8.8.4/}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBMODPLUG,libmodplug,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

libmodplug-install:
	$(INSTALL_DIR) $(IDIR_LIBMODPLUG)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libmodplug*.so* \
		$(IDIR_LIBMODPLUG)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
