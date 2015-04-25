# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		stunnel
PKG_VERSION:=		5.16
PKG_RELEASE:=		1
PKG_HASH:=		b6b7e93fb2626eaabae1c8474e1dfa23962cfde8fa35c8602289fcaa4f53608d
PKG_DESCR:=		encryption wrapper
PKG_SECTION:=		net/security
PKG_DEPENDS:=		libopenssl
PKG_BUILDDEP:=		openssl
PKG_URL:=		https://www.stunnel.org
PKG_SITES:=		https://www.stunnel.org/downloads/

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,STUNNEL,stunnel,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

AUTOTOOL_STYLE:=	autoreconf
CONFIGURE_ARGS+=	--with-ssl=${STAGING_TARGET_DIR}/usr \
			--disable-systemd \
			--disable-libwrap

stunnel-install:
	$(INSTALL_DIR) $(IDIR_STUNNEL)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/stunnel \
		$(IDIR_STUNNEL)/usr/bin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
