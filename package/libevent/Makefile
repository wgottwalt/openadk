# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libevent
PKG_VERSION:=		1.4.14b
PKG_RELEASE:=		1
PKG_MD5SUM:=		a00e037e4d3f9e4fe9893e8a2d27918c
PKG_DESCR:=		Event notification library for event-driven network servers
PKG_SECTION:=		libs
PKG_URL:=		http://www.monkey.org/~provos/
PKG_SITES:=		http://www.monkey.org/~provos/

DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION)-stable.tar.gz
WRKDIST=		$(WRKDIR)/$(PKG_NAME)-$(PKG_VERSION)-stable

PKG_SUBPKGS:=		LIBEVENT LIBEVENT_DEV
PKGSD_LIBEVENT_DEV:=	development files for libevent
PKGSC_LIBEVENT_DEV:=	devel

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBEVENT,libevent,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBEVENT_DEV,libevent-dev,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBEVENT_DEV},${PKGSC_LIBEVENT_DEV}))

TARGET_CFLAGS:=         $(filter-out -flto,$(TARGET_CFLAGS))

libevent-install:
	$(INSTALL_DIR) $(IDIR_LIBEVENT)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libevent*.so* $(IDIR_LIBEVENT)/usr/lib

libevent-dev-install:
	${INSTALL_DIR} ${IDIR_LIBEVENT_DEV}/usr/include
	${CP} ${WRKINST}/usr/include/*.h ${IDIR_LIBEVENT_DEV}/usr/include

include ${TOPDIR}/mk/pkg-bottom.mk
