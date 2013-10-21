# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libevent
PKG_VERSION:=		1.4.14b
PKG_RELEASE:=		2
PKG_MD5SUM:=		a00e037e4d3f9e4fe9893e8a2d27918c
PKG_DESCR:=		Event notification library for event-driven network servers
PKG_SECTION:=		libs
PKG_URL:=		http://www.monkey.org/~provos/
PKG_SITES:=		http://www.monkey.org/~provos/
PKG_OPTS:=		dev

DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION)-stable.tar.gz
WRKDIST=		$(WRKDIR)/$(PKG_NAME)-$(PKG_VERSION)-stable

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBEVENT,libevent,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

TARGET_CFLAGS:=         $(filter-out -flto,$(TARGET_CFLAGS))

libevent-install:
	$(INSTALL_DIR) $(IDIR_LIBEVENT)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libevent*.so* $(IDIR_LIBEVENT)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
