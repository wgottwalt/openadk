# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		stunnel
PKG_VERSION:=		5.01
PKG_RELEASE:=		1
PKG_MD5SUM:=		7b63266b6fa05da696729e245100da65
PKG_DESCR:=		encryption wrapper
PKG_SECTION:=		net/security
PKG_DEPENDS:=		libopenssl
PKG_BUILDDEP:=		autotool openssl
PKG_URL:=		https://www.stunnel.org
PKG_SITES:=		https://www.stunnel.org/downloads/

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,STUNNEL,stunnel,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

AUTOTOOL_STYLE:=	autoreconf
CONFIGURE_ARGS+=	--with-ssl=${STAGING_TARGET_DIR}/usr \
			--disable-libwrap

stunnel-install:
	$(INSTALL_DIR) $(IDIR_STUNNEL)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/stunnel \
		$(IDIR_STUNNEL)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
