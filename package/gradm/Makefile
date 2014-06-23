# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		gradm
PKG_VERSION:=		3.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		55d5032573a3835ef52f2226305ee89e
PKG_DESCR:=		rbac administration utility
PKG_SECTION:=		sys/misc
PKG_BUILDDEP:=		bison-host flex-host
PKG_URL:=		http://grsecurity.net/
PKG_SITES:=		http://grsecurity.net/stable/

WRKDIST=		${WRKDIR}/${PKG_NAME}
DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}-201401291757.tar.gz

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,GRADM,gradm,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual

gradm-install:
	$(INSTALL_DIR) $(IDIR_GRADM)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/gradm \
		$(IDIR_GRADM)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
