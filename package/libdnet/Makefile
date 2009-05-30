# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libdnet
PKG_VERSION:=		1.10
PKG_RELEASE:=		1
PKG_MD5SUM:=		416b765e9d9961501ac85e9a366fd219
PKG_DESCR:=		a low-level networking library
PKG_SECTION:=		libs
PKG_URL:=		http://libdnet.sourceforge.net/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=$(PKG_NAME)/}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBDNET,libdnet,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE=	gnu
CONFIGURE_ENV+=		ac_cv_dnet_bsd_bpf=no
CONFIGURE_ARGS+=	--without-check
BUILD_STYLE=		auto
INSTALL_STYLE=		auto

post-install:
	$(INSTALL_DIR) $(IDIR_LIBDNET)/usr/lib
	$(INSTALL_DIR) $(IDIR_LIBDNET)/usr/sbin
	$(CP) $(WRKINST)/usr/lib/libdnet.so.* $(IDIR_LIBDNET)/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
