# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		rpcbind
PKG_VERSION:=		0.2.1
PKG_RELEASE:=		2
PKG_MD5SUM:=		0a5f9c2142af814c55d957aaab3bcc68
PKG_DESCR:=		converts rpc program numbers into universal addresses
PKG_SECTION:=		net/misc
PKG_DEPENDS:=		libtirpc
PKG_BUILDDEP:=		libtirpc
PKG_URL:=		http://sourceforge.net/projects/rpcbind/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=rpcbind/}

PKG_LIBC_DEPENDS:=	uclibc glibc

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,RPCBIND,rpcbind,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TARGET_CPPFLAGS+=	-I${STAGING_TARGET_DIR}/usr/include/tirpc
CONFIGURE_ARGS+=	--disable-libwrap \
			--with-rpcuser=root

rpcbind-install:
	$(INSTALL_DIR) $(IDIR_RPCBIND)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/rpcbind \
		$(IDIR_RPCBIND)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/rpcinfo \
		$(IDIR_RPCBIND)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
