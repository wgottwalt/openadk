# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		inotify-tools
PKG_VERSION:=		3.14
PKG_RELEASE:=		1
PKG_MD5SUM:=		b43d95a0fa8c45f8bab3aec9672cf30c
PKG_DESCR:=		Command line programs providing a simple interface to inotify
PKG_SECTION:=		sys/fs
PKG_URL:=		https://github.com/rvoicilas/inotify-tools/wiki
PKG_SITES:=		http://github.com/downloads/rvoicilas/inotify-tools/

PKG_SUBPKGS:=		INOTIFYWAIT INOTIFYWATCH LIBINOTIFYTOOLS
PKGSC_LIBINOTIFYTOOLS:=	libs/fs
PKGSD_INOTIFYWAIT:=	Wait for changes to files using inotify
PKGSD_INOTIFYWATCH:=	Gather filesystem access statistics using inotify
PKGSD_LIBINOTIFYTOOLS:=	Inotify tools library

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,INOTIFYWAIT,inotifywait,$(PKG_VERSION)-${PKG_RELEASE},libinotifytools,${PKGSD_INOTIFYWAIT},${PKG_SECTION}))
$(eval $(call PKG_template,INOTIFYWATCH,inotifywatch,$(PKG_VERSION)-${PKG_RELEASE},libinotifytools,${PKGSD_INOTIFYWATCH},${PKG_SECTION}))
$(eval $(call PKG_template,LIBINOTIFYTOOLS,libinotifytools,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBINOTIFYTOOLS},${PKGSC_LIBINOTIFYTOOLS}))

post-install:
	$(INSTALL_DIR) $(IDIR_INOTIFYWAIT)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/inotifywait $(IDIR_INOTIFYWAIT)/usr/bin
	$(INSTALL_DIR) $(IDIR_INOTIFYWATCH)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/inotifywatch $(IDIR_INOTIFYWATCH)/usr/bin
	$(INSTALL_DIR) $(IDIR_LIBINOTIFYTOOLS)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libinotifytools.so* $(IDIR_LIBINOTIFYTOOLS)/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
