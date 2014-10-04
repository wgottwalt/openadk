# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		w3m
PKG_VERSION:=		0.5.3
PKG_RELEASE:=		3
PKG_MD5SUM:=		1b845a983a50b8dec0169ac48479eacc
PKG_DESCR:=		console web browser
PKG_SECTION:=		app/browser
PKG_DEPENDS:=		libgc libncurses
PKG_BUILDDEP:=		libgc-host libgc ncurses
PKG_URL:=		http://w3m.sourceforge.net/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=w3m/}

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,W3M,w3m,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TARGET_LDFLAGS+=	-lncurses -ltinfo
CONFIGURE_ENV+=		ac_cv_func_setpgrp_void=yes
CONFIGURE_ARGS+=	--with-termlib=ncurses \
			--with-gc=${STAGING_TARGET_DIR}/usr \
			--enable-image=no

w3m-install:
	$(INSTALL_DIR) $(IDIR_W3M)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/w3m \
		$(IDIR_W3M)/usr/bin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
