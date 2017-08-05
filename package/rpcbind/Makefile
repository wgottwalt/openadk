# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		rpcbind
PKG_VERSION:=		0.2.4
PKG_RELEASE:=		2
PKG_HASH:=		074a9a530dc7c11e0d905aa59bcb0847c009313f02e98d3d798aa9568f414c66
PKG_DESCR:=		converts rpc program numbers into universal addresses
PKG_SECTION:=		net/misc
PKG_DEPENDS:=		libtirpc
PKG_BUILDDEP:=		libtirpc
PKG_URL:=		http://sourceforge.net/projects/rpcbind/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=rpcbind/}

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,RPCBIND,rpcbind,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TARGET_CPPFLAGS+=	-I${STAGING_TARGET_DIR}/usr/include/tirpc
CONFIGURE_ARGS+=	--disable-libwrap \
			--without-systemdsystemunitdir \
			--with-rpcuser=root

rpcbind-install:
	$(INSTALL_DIR) $(IDIR_RPCBIND)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/rpcbind \
		$(IDIR_RPCBIND)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/rpcinfo \
		$(IDIR_RPCBIND)/usr/bin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
