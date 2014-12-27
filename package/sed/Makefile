# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		sed
PKG_VERSION:=		4.2.2
PKG_RELEASE:=		1
PKG_HASH:=		fea0a94d4b605894f3e2d5572e3f96e4413bcad3a085aae7367c2cf07908b2ff
PKG_DESCR:=		stream editor
PKG_SECTION:=		app/editor
PKG_URL:=		http://www.gnu.org/software/sed/
PKG_SITES:=		${MASTER_SITE_GNU:=sed/}
PKG_BB:=		1

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,SED,sed,$(PKG_VERSION)-${PKG_RELEASE}))
$(eval $(call PKG_template,SED,sed,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

sed-install:
	$(INSTALL_DIR) $(IDIR_SED)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/sed \
		$(IDIR_SED)/usr/bin

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
