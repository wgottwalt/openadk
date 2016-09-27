# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		haveged
PKG_VERSION:=		1.9.1
PKG_RELEASE:=		1
PKG_HASH:=		9c2363ed9542a6784ff08e247182137e71f2ddb79e8e6c1ac4ad50d21ced3715
PKG_DESCR:=		entropy gathering daemon
PKG_SECTION:=		sys/misc
PKG_SITES:=		http://www.issihosts.com/haveged/

PKG_ARCH_DEPENDS:=	!arm !mips

DISTFILES:=             $(PKG_NAME)-$(PKG_VERSION).tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,HAVEGED,haveged,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

CONFIGURE_ARGS+=	--enable-clock_gettime=yes

haveged-install:
	$(INSTALL_DIR) $(IDIR_HAVEGED)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libhaveg*.so* \
		$(IDIR_HAVEGED)/usr/lib
	$(INSTALL_DIR) $(IDIR_HAVEGED)/usr/sbin
	$(INSTALL_BIN) $(WRKINST)/usr/sbin/haveged \
		$(IDIR_HAVEGED)/usr/sbin

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
