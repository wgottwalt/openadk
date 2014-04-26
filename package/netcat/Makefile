# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		netcat
PKG_VERSION:=		0.7.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		088def25efe04dcdd1f8369d8926ab34
PKG_DESCR:=		the GNU network swiss army knife
PKG_SECTION:=		net/misc
PKG_URL:=		http://netcat.sourceforge.net/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=netcat/}

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,NETCAT,netcat,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

netcat-install:
	$(INSTALL_DIR) $(IDIR_NETCAT)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/netcat \
		$(IDIR_NETCAT)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
