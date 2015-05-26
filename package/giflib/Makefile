# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		giflib
PKG_VERSION:=		5.1.1
PKG_RELEASE:=		1
PKG_HASH:=		52b5e1074b4fe72bb545cf997a9fc04843a87a3ab6d799601a52476ef97a52d1
PKG_DESCR:=		gif graphics library
PKG_SECTION:=		libs/image
PKG_URL:=		http://sourceforge.net/projects/giflib/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=giflib/}
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,GIFLIB,giflib,$(PKG_VERSION)-${PKG_RELEASE}))
$(eval $(call PKG_template,GIFLIB,giflib,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

giflib-install:
	$(INSTALL_DIR) $(IDIR_GIFLIB)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libgif.so* \
		$(IDIR_GIFLIB)/usr/lib

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
