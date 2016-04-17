# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		zmqpp
PKG_VERSION:=		develop
PKG_RELEASE:=		1
PKG_GIT:=		branch
PKG_DESCR:=		c++ bindings for zeromq
PKG_SECTION:=		libs/misc
PKG_BUILDDEP:=		cmake-host
PKG_NEEDS:=		c++
PKG_URL:=		http://zeromq.github.io/zmqpp/
PKG_SITES:=		https://github.com/zeromq/zmqpp.git
PKG_OPTS:=		dev

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,ZMQPP,zmqpp,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION),$(PKG_OPTS)))

CONFIG_STYLE:=		cmake

zmqpp-install:
	$(INSTALL_DIR) $(IDIR_ZMQPP)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libzmqpp*.so* \
		$(IDIR_ZMQPP)/usr/lib

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
