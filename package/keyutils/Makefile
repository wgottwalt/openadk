# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		keyutils
PKG_VERSION:=		1.5.9
PKG_RELEASE:=		1
PKG_MD5SUM:=		7f8ac985c45086b5fbcd12cecd23cf07
PKG_DESCR:=		utilities for managing the key retention facility
PKG_SECTION:=		libs/misc
PKG_SITES:=		http://people.redhat.com/dhowells/keyutils/
PKG_OPTS:=		dev

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,KEYUTILS,keyutils,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIG_STYLE:=		manual

keyutils-install:
	$(INSTALL_DIR) $(IDIR_KEYUTILS)/usr/lib
	$(CP) $(WRKBUILD)/libkeyutils.so* \
		$(IDIR_KEYUTILS)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
