# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		brutefir
PKG_VERSION:=		1.0m
PKG_RELEASE:=		1
PKG_HASH:=		23b80500fc8687be338bc2654ecc509eccc06fe9372815361b65ed9b1807ccca
PKG_DESCR:=		convulution engine
PKG_SECTION:=		mm/audio
PKG_DEPENDS:=		fftw
PKG_BUILDDEP:=		flex-host fftw
PKG_URL:=		http://www.ludd.luth.se/~torger/brutefir.html
PKG_SITES:=		http://www.ludd.luth.se/~torger/files/	

# if downloaded package is not ending with .tar.xz use following
DISTFILES:=             $(PKG_NAME)-$(PKG_VERSION).tar.gz

MAKE_ENV+= FLEX=$(STAGING_HOST_DIR)/usr/bin/flex

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,BRUTEFIR,brutefir,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

CONFIG_STYLE=		manual

brutefir-install:
	$(INSTALL_DIR) $(IDIR_BRUTEFIR)/usr/bin
	$(INSTALL_DIR) $(IDIR_BRUTEFIR)/usr/lib/brutefir
	$(INSTALL_BIN) $(WRKINST)/usr/local/bin/brutefir \
		$(IDIR_BRUTEFIR)/usr/bin
	$(CP) $(WRKINST)/usr/local/lib $(IDIR_BRUTEFIR)/usr/lib
include $(ADK_TOPDIR)/mk/pkg-bottom.mk
