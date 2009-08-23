# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		aufs2-util
PKG_VERSION:=		130809
PKG_RELEASE:=		1
PKG_DESCR:=		aufs2 utilities
PKG_SECTION:=		admin
PKG_URL:=		http://aufs.sf.net/

NO_DISTFILES:=		1

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,AUFS_UTIL,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

MAKE_FLAGS+=		KDIR=${LINUX_DIR}
BUILD_STYLE=		auto
INSTALL_STYLE=		auto

do-extract:
	mkdir -p ${WRKBUILD}
	${CP} ./src/* ${WRKBUILD}/

do-configure:

#post-install:
#	$(INSTALL_DIR) $(IDIR_BASH)/bin
#	$(INSTALL_BIN) $(WRKINST)/usr/bin/bash $(IDIR_BASH)/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
