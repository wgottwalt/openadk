# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		oprofile
PKG_VERSION:=		0.9.4
PKG_RELEASE:=		1
PKG_MD5SUM:=		82b059379895cf125261d7d773465915
MASTER_SITES:=		${MASTER_SITE_SOURCEFORGE:=oprofile/}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,OPROFILE,oprofile,$(PKG_VERSION)-$(PKG_RELEASE)))

TLDFLAGS+=		-shared
CONFIGURE_STYLE=	gnu
CONFIGURE_ARGS+=	--with-kernel-support --with-linux=${LINUX_DIR}
BUILD_STYLE=		auto
INSTALL_STYLE=		auto

post-install:
	$(INSTALL_DIR) $(IDIR_OPROFILE)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/opcontrol $(IDIR_OPROFILE)/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
