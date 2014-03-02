# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		rpcbind
PKG_VERSION:=		0.2.0
PKG_RELEASE:=		3
PKG_MD5SUM:=		1a77ddb1aaea8099ab19c351eeb26316
PKG_DESCR:=		converts RPC program numbers into universal addresses
PKG_SECTION:=		net/misc
PKG_DEPENDS:=		libtirpc
PKG_BUILDDEP:=		libtirpc autotool
PKG_URL:=		http://sourceforge.net/projects/rpcbind/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=rpcbind/}

PKG_LIBC_DEPENDS:=	uclibc glibc

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,RPCBIND,rpcbind,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

AUTOTOOL_STYLE:=	autoreconf
TARGET_CPPFLAGS+=	-I${STAGING_TARGET_DIR}/usr/include/tirpc
CONFIGURE_ARGS+=	--disable-libwrap

rpcbind-install:
	$(INSTALL_DIR) $(IDIR_RPCBIND)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/rpcbind \
		$(IDIR_RPCBIND)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/rpcinfo \
		$(IDIR_RPCBIND)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
