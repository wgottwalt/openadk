# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		6tunnel
PKG_VERSION:=		0.11rc1
PKG_RELEASE:=		1
PKG_MD5SUM:=		b325fa9d238e32195fbb3fc3646b0d28
PKG_DESCR:=		IPv4/IPv6 tunnel proxy
PKG_SECTION:=		net
PKG_SITES:=		http://toxygen.net/6tunnel/

WRKDIST=		${WRKDIR}/$(PKG_NAME)-0.11

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,6TUNNEL,6tunnel,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE=	gnu
CONFIGURE_ENV+=		ac_cv_path_STRIP=$(STRIP) \
			ac_cv_func_vsnprintf=yes
ALL_TARGET=		default
BUILD_STYLE=		auto

post-install:
	$(INSTALL_DIR) $(IDIR_6TUNNEL)/usr/sbin
	$(INSTALL_BIN) $(WRKBUILD)/6tunnel $(IDIR_6TUNNEL)/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
