# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libestr
PKG_VERSION:=		0.1.9
PKG_RELEASE:=		1
PKG_MD5SUM:=		681ca0ed7e5ae6ddff70fdec413096e4
PKG_DESCR:=		some essentials for string handling
PKG_SECTION:=		libs/misc
PKG_URL:=		http://libestr.adiscon.com/
PKG_SITES:=		http://libestr.adiscon.com/files/download/
PKG_OPTS:=		dev

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBESTR,libestr,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

libestr-install:
	$(INSTALL_DIR) $(IDIR_LIBESTR)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libestr*.so* \
		$(IDIR_LIBESTR)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
