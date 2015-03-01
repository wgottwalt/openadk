# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		inotify-tools
PKG_VERSION:=		3.14
PKG_RELEASE:=		1
PKG_HASH:=		222bcca8893d7bf8a1ce207fb39ceead5233b5015623d099392e95197676c92f
PKG_DESCR:=		command line programs providing a simple interface to inotify
PKG_SECTION:=		sys/fs
PKG_URL:=		https://github.com/rvoicilas/inotify-tools/wiki
PKG_SITES:=		http://github.com/downloads/rvoicilas/inotify-tools/

DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).tar.gz

PKG_SUBPKGS:=		INOTIFYWAIT INOTIFYWATCH LIBINOTIFYTOOLS
PKGSC_LIBINOTIFYTOOLS:=	libs/misc
PKGSD_INOTIFYWAIT:=	wait for changes to files using inotify
PKGSD_INOTIFYWATCH:=	gather filesystem access statistics using inotify
PKGSD_LIBINOTIFYTOOLS:=	inotify tools library

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,INOTIFYWAIT,inotifywait,$(PKG_VERSION)-$(PKG_RELEASE),libinotifytools,$(PKGSD_INOTIFYWAIT),$(PKG_SECTION)))
$(eval $(call PKG_template,INOTIFYWATCH,inotifywatch,$(PKG_VERSION)-$(PKG_RELEASE),libinotifytools,$(PKGSD_INOTIFYWATCH),$(PKG_SECTION)))
$(eval $(call PKG_template,LIBINOTIFYTOOLS,libinotifytools,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKGSD_LIBINOTIFYTOOLS),$(PKGSC_LIBINOTIFYTOOLS)))

inotifywait-install:
	$(INSTALL_DIR) $(IDIR_INOTIFYWAIT)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/inotifywait $(IDIR_INOTIFYWAIT)/usr/bin

inotifywatch-install:
	$(INSTALL_DIR) $(IDIR_INOTIFYWATCH)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/inotifywatch $(IDIR_INOTIFYWATCH)/usr/bin

libinotifytools-install:
	$(INSTALL_DIR) $(IDIR_LIBINOTIFYTOOLS)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libinotifytools.so* $(IDIR_LIBINOTIFYTOOLS)/usr/lib

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
