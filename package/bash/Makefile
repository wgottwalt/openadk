# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		bash
PKG_VERSION:=		4.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		9800d8724815fd84994d9be65ab5e7b8
PKG_DESCR:=		Bourne-Again SHell
PKG_SECTION:=		shells
PKG_URL:=		http://www.gnu.org/software/bash/
PKG_SITES:=		http://ftp.gnu.org/gnu/bash/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,BASH,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

XAKE_FLAGS+=		LIBS_FOR_BUILD=''

post-install:
	$(INSTALL_DIR) $(IDIR_BASH)/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/bash $(IDIR_BASH)/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
