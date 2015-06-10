# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libiconv
PKG_VERSION:=		1.14
PKG_RELEASE:=		1
PKG_HASH:=		e34509b1623cec449dfeb73d7ce9c6c6
PKG_DESCR:=		character set conversion library
PKG_SECTION:=		libs/misc
PKG_URL:=		http://www.gnu.org/software/libiconv/
PKG_SITES:=		$(MASTER_SITE_GNU:=libiconv/)
PKG_OPTS:=		dev

DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBICONV,libiconv,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION),$(PKG_OPTS)))

libiconv-install:
	$(INSTALL_DIR) $(IDIR_LIBICONV)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libiconv.so* $(IDIR_LIBICONV)/usr/lib/
	$(CP) $(WRKINST)/usr/lib/libcharset.so* $(IDIR_LIBICONV)/usr/lib/

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
