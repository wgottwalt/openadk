# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		asplib
PKG_VERSION:=		f7219142e790a329b002a94f3db943abcb183739
PKG_RELEASE:=		1
PKG_DESCR:=		signal processing library
PKG_SECTION:=		libs/misc
PKG_NEEDS:=		c++
PKG_BUILDDEP:=		cmake-host
PKG_URL:=		https://github.com/AchimTuran/asplib
PKG_SITES:=		https://github.com/AchimTuran/asplib.git
PKG_OPTS:=		dev

WRKBUILD=		$(WRKDIR)/$(PKG_NAME)-obj

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,ASPLIB,asplib,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION),$(PKG_OPTS)))

CONFIG_STYLE:=		cmake
CMAKE_FLAGS+=		-DASPLIB_MODULES_TO_BUILD=FFT

asplib-install:
	$(INSTALL_DIR) $(IDIR_ASPLIB)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libasplib*.so* \
		$(IDIR_ASPLIB)/usr/lib

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
