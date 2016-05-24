# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		log4cpp
PKG_VERSION:=		1.1.1
PKG_RELEASE:=		1
PKG_HASH:=		35abf332630a6809c969276b1d60b90c81a95daf24c86cfd7866ffef72f9bed0
PKG_DESCR:=		logging framework for c++
PKG_SECTION:=		libs/misc
PKG_NEEDS:=		threads
PKG_URL:=		http://log4cpp.sourceforge.net/
PKG_SITES:=		$(MASTER_SITE_SOURCEFORGE:=log4cpp/log4cpp-1.1.x%20%28new%29/log4cpp-1.1/)
PKG_OPTS:=		dev

DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).tar.gz
WRKDIST=		$(WRKDIR)/$(PKG_NAME)

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LOG4CPP,log4cpp,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION),$(PKG_OPTS)))

XAKE_FLAGS+=            man3dir=$(WRKINST)/usr/share/man/man3 \
			docdir=$(WRKINST)/usr/doc/$(PKG_NAME)-$(PKG_VERSION)

log4cpp-install:
	$(INSTALL_DIR) $(IDIR_LOG4CPP)/usr/lib
	$(CP) $(WRKINST)/usr/lib/lib$(PKG_NAME).so* $(IDIR_LOG4CPP)/usr/lib

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
