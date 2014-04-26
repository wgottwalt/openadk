# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		mpdbox
PKG_VERSION:=		1.0
PKG_RELEASE:=		2
PKG_MD5SUM:=		ac0dc1cc7141c1eca66d8ddd98574e0b
PKG_DESCR:=		MPD web interface
PKG_SECTION:=		multimedia
PKG_URL:=		http://www.openadk.org/cgi-bin/gitweb.cgi?p=mpdbox.git;a=summary
PKG_SITES:=		http://www.openadk.org/distfiles/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,MPDBOX,mpdbox,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

mpdbox-install:
	$(INSTALL_DIR) $(IDIR_MPDBOX)/srv/www/htdocs
	$(CP) $(WRKBUILD)/* \
		$(IDIR_MPDBOX)/srv/www/htdocs
	$(CP) $(IDIR_MPDBOX)/srv/www/htdocs/inc/config.inc.example \
		$(IDIR_MPDBOX)/srv/www/htdocs/inc/config.inc

include ${TOPDIR}/mk/pkg-bottom.mk
