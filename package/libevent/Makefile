# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libevent
PKG_VERSION:=		2.0.21
PKG_RELEASE:=		1
PKG_HASH:=		22a530a8a5ba1cb9c080cba033206b17dacd21437762155c6d30ee6469f574f5
PKG_DESCR:=		event notification library for event-driven network servers
PKG_SECTION:=		libs/net
PKG_URL:=		http://libevent.org/
PKG_SITES:=		https://github.com/downloads/libevent/libevent/
PKG_OPTS:=		dev

DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION)-stable.tar.gz
WRKDIST=		$(WRKDIR)/$(PKG_NAME)-$(PKG_VERSION)-stable

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBEVENT,libevent,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

libevent-install:
	$(INSTALL_DIR) $(IDIR_LIBEVENT)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libevent*.so* $(IDIR_LIBEVENT)/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
