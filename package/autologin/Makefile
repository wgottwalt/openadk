# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		autologin
PKG_VERSION:=		1.0
PKG_RELEASE:=		1
PKG_DESCR:=		tool to automatically login a user with getty
PKG_SECTION:=		sys/misc

PKG_NOPARALLEL:=	1
NO_DISTFILES:=		1

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,AUTOLOGIN,autologin,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=          manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=         manual

TARGET_CPPFLAGS+=	-I../autologin
TARGET_CPPFLAGS+=	-D_GNU_SOURCE

do-build:
	$(CC) src/autologin.c -o $(WRKBUILD)/autologin

autologin-install:
	$(INSTALL_DIR) $(IDIR_AUTOLOGIN)/bin
	$(INSTALL_BIN) $(WRKBUILD)/autologin $(IDIR_AUTOLOGIN)/bin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
