# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		newt
PKG_VERSION:=		0.52.19
PKG_RELEASE:=		1
PKG_HASH:=		08c0db56c21996af6a7cbab99491b774c6c09cef91cd9b03903c84634bff2e80
PKG_DESCR:=		windowing toolkit
PKG_SECTION:=		libs/misc
PKG_DEPENDS:=		slang libpopt
PKG_BUILDDEP:=		slang popt
PKG_URL:=		https://pagure.io
PKG_SITES:=		https://pagure.io/releases/newt/

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
