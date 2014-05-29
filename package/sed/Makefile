# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		sed
PKG_VERSION:=		4.2.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		4111de4faa3b9848a0686b2f260c5056
PKG_DESCR:=		stream editor
PKG_SECTION:=		app/editor
PKG_URL:=		http://www.gnu.org/software/sed/
PKG_SITES:=		${MASTER_SITE_GNU:=sed/}
PKG_BB:=		1

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(TOPDIR)/mk/host.mk
include $(TOPDIR)/mk/package.mk

$(eval $(call HOST_template,SED,sed,$(PKG_VERSION)-${PKG_RELEASE}))
$(eval $(call PKG_template,SED,sed,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

HOST_STYLE:=		auto

sed-install:
	$(INSTALL_DIR) $(IDIR_SED)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/sed \
		$(IDIR_SED)/usr/bin

include ${TOPDIR}/mk/host-bottom.mk
include ${TOPDIR}/mk/pkg-bottom.mk
