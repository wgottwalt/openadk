# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		newt
PKG_VERSION:=		0.52.18
PKG_RELEASE:=		1
PKG_HASH:=		771b0e634ede56ae6a6acd910728bb5832ac13ddb0d1d27919d2498dab70c91e
PKG_DESCR:=		windowing toolkit
PKG_SECTION:=		libs/misc
PKG_DEPENDS:=		slang libpopt
PKG_BUILDDEP:=		slang popt
PKG_URL:=		https://fedorahosted.org/newt/
PKG_SITES:=		https://fedorahosted.org/releases/n/e/$(PKG_NAME)/

DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,NEWT,newt,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

CONFIGURE_ARGS+=	--without-python \
			--without-tcl \
			--without-gpm-support

newt-install:
	$(INSTALL_DIR) $(IDIR_NEWT)/usr/{bin,lib}
	$(INSTALL_BIN) $(WRKINST)/usr/bin/whiptail \
		$(IDIR_NEWT)/usr/bin
	$(CP) $(WRKINST)/usr/lib/libnewt.so* \
		$(IDIR_NEWT)/usr/lib

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
