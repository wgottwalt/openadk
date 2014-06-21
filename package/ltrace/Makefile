# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		ltrace
PKG_VERSION:=		0.7.4
# git from 24.05.2014
PKG_RELEASE:=		1
PKG_MD5SUM:=		266580175adba8cbb02b6b792d9f05f5
PKG_DESCR:=		intercepts and records dynamic library calls 
PKG_SECTION:=		app/debug
PKG_DEPENDS:=		libelf
PKG_BUILDDEP:=		libelf
PKG_URL:=		http://ltrace.org/
PKG_SITES:=		http://openadk.org/distfiles/

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LTRACE,ltrace,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

AUTOTOOL_STYLE:=	autoreconf
CONFIGURE_ARGS+=	--disable-werror

ltrace-install:
	$(INSTALL_DIR) $(IDIR_LTRACE)/usr/sbin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/ltrace \
		$(IDIR_LTRACE)/usr/sbin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
