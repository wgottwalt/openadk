# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		keyutils
PKG_VERSION:=		1.5.3
PKG_RELEASE:=		1
PKG_MD5SUM:=		4c89b350eab1c361af8cb5343961056a
PKG_DESCR:=		set of utilities for managing the key retention facility in the kernel
PKG_SECTION:=		libs
PKG_SITES:=		http://people.redhat.com/dhowells/keyutils/
PKG_OPTS:=		dev

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,KEYUTILS,keyutils,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIG_STYLE:=		manual
INSTALL_TARGET:=	libinstall

keyutils-install:
	$(INSTALL_DIR) $(IDIR_KEYUTILS)/usr/lib
	$(CP) $(WRKBUILD)/libkeyutils.so* \
		$(IDIR_KEYUTILS)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
