# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		jack2
PKG_VERSION:=		1.9.10
PKG_RELEASE:=		1
PKG_MD5SUM:=		9ba759b640f9012d9a5e971a26675c6e
PKG_DESCR:=		audio connection kit
PKG_SECTION:=		mm/audio
PKG_DEPENDS:=		alsa-lib libsndfile
PKG_BUILDDEP:=		python2-host alsa-lib libsndfile
PKG_URL:=		http://jackaudio.org
PKG_SITES:=		http://openadk.org/distfiles/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,JACK2,jack2,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

do-configure:
	cd $(WRKBUILD) && ./waf configure --alsa --prefix=/usr

do-build:
	cd $(WRKBUILD) && ./waf build

do-install:
	cd $(WRKBUILD) && ./waf install --destdir=$(WRKINST)

jack2-install:
	$(INSTALL_DIR) $(IDIR_JACK2)/usr/bin
	$(CP) $(WRKINST)/usr/bin/jack* \
		$(IDIR_JACK2)/usr/bin
	$(INSTALL_DIR) $(IDIR_JACK2)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libjack{,server,net}.so* \
		$(IDIR_JACK2)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
