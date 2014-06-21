# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		eventlog
PKG_VERSION:=		0.2.12
PKG_RELEASE:=		1
PKG_MD5SUM:=		a044b1cd097613c3c1d09c4a7de51c43
PKG_DESCR:=		eventlog library for syslog-ng
PKG_SECTION:=		libs/misc
PKG_URL:=		http://www.balabit.com
PKG_SITES:=		http://www.balabit.com/downloads/files/syslog-ng/open-source-edition/3.5.4.1/source/

DISTFILES:=             ${PKG_NAME}_${PKG_VERSION}+20120504+1700.tar.gz
WRKDIST=		${WRKDIR}/${PKG_NAME}-${PKG_VERSION}+20120504+1700

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,EVENTLOG,eventlog,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

eventlog-install:
	$(INSTALL_DIR) $(IDIR_EVENTLOG)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libevtlog*.so* \
		$(IDIR_EVENTLOG)/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
