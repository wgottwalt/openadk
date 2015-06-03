# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		mpdbox
PKG_VERSION:=		1.0.1
PKG_RELEASE:=		1
PKG_HASH:=		c8aaeb932c1e21a7fed7223ef35f85e3dc4b0a7901a986e880bd53b88ed61c11
PKG_DESCR:=		mpd web interface
PKG_SECTION:=		mm/audio
PKG_URL:=		http://www.openadk.org/cgi-bin/gitweb.cgi?p=mpdbox.git;a=summary
PKG_SITES:=		http://distfiles.openadk.org/

include $(ADK_TOPDIR)/mk/package.mk

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

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
