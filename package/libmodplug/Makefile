# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libmodplug
PKG_VERSION:=		0.8.8.5
PKG_RELEASE:=		1
PKG_MD5SUM:=		5f30241db109d647781b784e62ddfaa1
PKG_DESCR:=		mod player library
PKG_SECTION:=		libs/audio
PKG_URL:=		http://modplug-xmms.sourceforge.net
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=modplug-xmms/libmodplug/0.8.8.5/}
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBMODPLUG,libmodplug,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

libmodplug-install:
	$(INSTALL_DIR) $(IDIR_LIBMODPLUG)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libmodplug*.so* \
		$(IDIR_LIBMODPLUG)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
