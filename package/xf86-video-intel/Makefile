# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		xf86-video-intel
PKG_VERSION:=		bde946054efbc1c7ae1483b84c3b4fa3c2c7e2ec
PKG_GIT:=		hash
PKG_RELEASE:=		1
PKG_HASH:=		b30dfa89f26f0f88c561f615d3c260d57bc095870d77b4ee565263c31bc52ce0
PKG_DESCR:=		x11 driver for intel vga chips
PKG_SECTION:=		x11/drivers
PKG_DEPENDS:=		xorg-server libdrm mesa libudev
PKG_BUILDDEP:=		xorg-server libdrm xf86driproto mesa eudev
PKG_NEEDS:=		c++
PKG_SITES:=		https://anongit.freedesktop.org/git/xorg/driver/xf86-video-intel.git

PKG_CFLINE_XF86_VIDEO_INTEL:=	depends on ADK_TARGET_WITH_VGA || ADK_TARGET_GENERIC



include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XF86_VIDEO_INTEL,xf86-video-intel,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

AUTOTOOL_STYLE:=	autogen

xf86-video-intel-install:
	$(INSTALL_DIR) $(IDIR_XF86_VIDEO_INTEL)/usr/lib/xorg/modules/drivers
	$(CP) $(WRKINST)/usr/lib/xorg/modules/drivers/*.so \
		$(IDIR_XF86_VIDEO_INTEL)/usr/lib/xorg/modules/drivers/

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
