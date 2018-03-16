# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		ivykis
PKG_VERSION:=		git
PKG_RELEASE:=		1
PKG_DESCR:=		asynchronous i/o readiness notification
PKG_SECTION:=		libs/misc
PKG_URL:=		https://github.com/buytenh/ivykis
PKG_SITES:=		https://github.com/buytenh/ivykis.git

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,IVYKIS,ivykis,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

AUTOTOOL_STYLE:=	autoreconf

ivykis-install:
	$(INSTALL_DIR) $(IDIR_IVYKIS)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libivykis.so* \
		$(IDIR_IVYKIS)/usr/lib

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
