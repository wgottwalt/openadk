# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		dillo
PKG_VERSION:=		3.0.3
PKG_RELEASE:=		2
PKG_MD5SUM:=		726cd0b7a18c5e25f4d80ebeffe7607e
PKG_DESCR:=		small graphical web browser
PKG_SECTION:=		x11/apps
PKG_DEPENDS:=		libfltk libxi libpng zlib libjpeg-turbo
PKG_DEPENDS+=		libstdcxx libpthread libopenssl
PKG_BUILDDEP:=		fltk libXi libiconv-tiny libjpeg-turbo libpng zlib openssl
PKG_URL:=		http://www.dillo.org/
PKG_SITES:=		http://www.dillo.org/download/
PKG_NEED_CXX:=		1

PKG_HOST_DEPENDS:=	!cygwin
PKG_ARCH_DEPENDS:=	x86 x86_64 mips arm

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,DILLO,dillo,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ENV+=		PNG_CONFIG=$(STAGING_TARGET_DIR)/scripts/libpng-config
TARGET_LDFLAGS+=	-liconv
XAKE_FLAGS+=		GCC_HONOUR_COPTS=s
CONFIGURE_ARGS+=	--enable-ssl

post-install:
	$(INSTALL_DIR) $(IDIR_DILLO)/etc/dillo
	$(INSTALL_DATA) $(WRKINST)/etc/dillo/* $(IDIR_DILLO)/etc/dillo
	$(INSTALL_DIR) $(IDIR_DILLO)/usr/bin $(IDIR_DILLO)/usr/lib/dillo
	$(INSTALL_BIN) $(WRKINST)/usr/bin/dillo $(IDIR_DILLO)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/dpid* $(IDIR_DILLO)/usr/bin
	$(CP) $(WRKINST)/usr/lib/dillo/* $(IDIR_DILLO)/usr/lib/dillo

include ${TOPDIR}/mk/pkg-bottom.mk
