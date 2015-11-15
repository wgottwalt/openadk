# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		beecrypt
PKG_VERSION:=		4.2.1
PKG_RELEASE:=		1
PKG_HASH:=		286f1f56080d1a6b1d024003a5fa2158f4ff82cae0c6829d3c476a4b5898c55d
PKG_DESCR:=		cryptography toolkit library
PKG_SECTION:=		libs/crypto
PKG_NEEDS:=		c++
PKG_URL:=		http://beecrypt.sourceforge.net/
PKG_SITES:=		http://sourceforge.net/projects/beecrypt/files/beecrypt/$(PKG_VERSION)/
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,BEECRYPT,beecrypt,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_ARGS+=	--without-cplusplus \
			--without-python \
			--without-java

beecrypt-install:
	$(INSTALL_DIR) $(IDIR_BEECRYPT)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libbeecrypt*.so* \
		$(IDIR_BEECRYPT)/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
