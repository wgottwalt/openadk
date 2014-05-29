# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		jack
PKG_VERSION:=		1.9.7
PKG_RELEASE:=		1
PKG_MD5SUM:=		9759670feecbd43eeccf1c0f743ec199
PKG_DESCR:=		audio connection kit
PKG_SECTION:=		mm/audio
PKG_DEPENDS:=		alsa-lib
PKG_BUILDDEP:=		python2 alsa-lib
PKG_URL:=		http://jackaudio.org
PKG_SITES:=		http://www.grame.fr/~letz/

PKG_ARCH_DEPENDS:=	x86
PKG_HOST_DEPENDS:=	!darwin

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,JACK,jack,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

do-configure:
	$(WRKSRC)/waf configure --alsa  --prefix=$(WRKINST)/usr

do-build:
	cd $(WRKSRC) && $(WRKSRC)/waf build

do-install:
	cd $(WRKSRC) && $(WRKSRC)/waf install

jack-install:
	$(INSTALL_DIR) $(IDIR_JACK)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/jack* \
		$(IDIR_JACK)/usr/bin
	$(INSTALL_DIR) $(IDIR_JACK)/usr/lib
	$(INSTALL_BIN) $(WRKINST)/usr/lib/lib* \
		$(IDIR_JACK)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
