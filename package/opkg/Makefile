# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		opkg
PKG_VERSION:=		0.2.4
PKG_RELEASE:=		1
PKG_HASH:=		0f40c7e457d81edf9aedc07c778f4697111ab163a38ef95999faece015453086
PKG_DESCR:=		embedded package manager
PKG_DEPENDS:=		libcurl
PKG_BUILDDEP:=		curl
PKG_NEEDS:=		threads
PKG_SECTION:=		sys/misc
PKG_URL:=		https://code.google.com/p/opkg/
PKG_SITES:=		http://downloads.yoctoproject.org/releases/opkg/

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,OPKG,opkg,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--disable-openssl \
			--disable-ssl-curl \
			--disable-gpg

opkg-install:
	$(INSTALL_DIR) $(IDIR_OPKG)/usr/bin
	$(INSTALL_DIR) $(IDIR_OPKG)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libopkg.so* \
		$(IDIR_OPKG)/usr/lib
	$(INSTALL_BIN) $(WRKINST)/usr/bin/opkg* \
		$(IDIR_OPKG)/usr/bin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
