# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libevent
PKG_VERSION:=		1.3
PKG_RELEASE:=		2
PKG_MD5SUM:=		d87b05143c6c2bc9464758e68e9c6e25
PKG_DESCR:=		Event notification library for event-driven network servers
PKG_SECTION:=		libs
PKG_URL:=		http://www.monkey.org/~provos
PKG_SITES:=		http://www.monkey.org/~provos/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBEVENT,libevent,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE=	gnu
BUILD_STYLE=		auto
INSTALL_STYLE=		auto

post-install:
	$(INSTALL_DIR) $(IDIR_LIBEVENT)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libevent-$(PKG_VERSION).so.* \
		$(IDIR_LIBEVENT)/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
