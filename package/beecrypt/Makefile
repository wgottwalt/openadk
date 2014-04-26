# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		beecrypt
PKG_VERSION:=		4.2.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		8441c014170823f2dff97e33df55af1e
PKG_DESCR:=		cryptography toolkit library
PKG_SECTION:=		libs
PKG_URL:=		http://beecrypt.sourceforge.net/
PKG_SITES:=		http://sourceforge.net/projects/beecrypt/files/beecrypt/$(PKG_VERSION)/
PKG_NEED_CXX:=		1
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,BEECRYPT,beecrypt,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_ARGS+=	--without-cplusplus \
			--without-python \
			--without-java

beecrypt-install:
	$(INSTALL_DIR) $(IDIR_BEECRYPT)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libbeecrypt*.so* \
		$(IDIR_BEECRYPT)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
