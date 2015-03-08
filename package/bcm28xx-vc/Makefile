# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		bcm28xx-vc
PKG_VERSION:=		0de0b205ea94ab61c24ea515cd3935e37d41ac03
PKG_RELEASE:=		1
PKG_DESCR:=		videocore tools and libraries for bcm28xx
PKG_SECTION:=		libs/video
PKG_DEPENDS:=		libpthread
PKG_BUILDDEP:=		cmake-host
PKG_URL:=		https://github.com/raspberrypi/userland
PKG_SITES:=		https://github.com/raspberrypi/userland.git

PKG_SUBPKGS:=		BCM28XX_VC_TOOLS BCM28XX_VC_LIBS BCM28XX_VC_GL_LIBS
PKGSS_BCM28XX_VC_TOOLS:=bcm28XX-vc-libs
PKGSC_BCM28XX_VC_TOOLS:=sys/hw
PKGSD_BCM28XX_VC_TOOLS:=videocore tool vcgencmd
PKGSC_BCM28XX_VC_LIBS:=	libs/misc
PKGSC_BCM28XX_VC_GL_LIBS:=libs/video

PKG_SYSTEM_DEPENDS:=	raspberry-pi raspberry-pi2

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,BCM28XX_VC_TOOLS,bcm28xx-vc-tools,$(PKG_VERSION)-$(PKG_RELEASE),$(PKGSS_BCM28XX_VC_TOOLS),$(PKG_DESCR),$(PKGSC_BCM28XX_VC_TOOLS)))
$(eval $(call PKG_template,BCM28XX_VC_LIBS,bcm28xx-vc-libs,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))
$(eval $(call PKG_template,BCM28XX_VC_GL_LIBS,bcm28xx-vc-gl-libs,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

CONFIG_STYLE:=          cmake

bcm28xx-vc-tools-install:
	$(INSTALL_DIR) $(IDIR_BCM28XX_VC_TOOLS)/opt/vc/bin
	$(INSTALL_BIN) $(WRKINST)/opt/vc/bin/vcgencmd \
		$(IDIR_BCM28XX_VC_TOOLS)/opt/vc/bin

bcm28xx-vc-libs-install:
	$(INSTALL_DIR) $(IDIR_BCM28XX_VC_LIBS)/opt/vc/lib
	$(CP) $(WRKINST)/opt/vc/lib/libvcos.so \
		$(IDIR_BCM28XX_VC_LIBS)/opt/vc/lib 
	$(CP) $(WRKINST)/opt/vc/lib/libvchiq_arm.so \
		$(IDIR_BCM28XX_VC_LIBS)/opt/vc/lib
	$(CP) $(WRKINST)/opt/vc/lib/libbcm_host.so \
		$(IDIR_BCM28XX_VC_LIBS)/opt/vc/lib
	$(CP) $(WRKINST)/opt/vc/lib/libcontainers.so \
		$(IDIR_BCM28XX_VC_LIBS)/opt/vc/lib
	-rm -rf $(STAGING_TARGET_DIR)/opt/vc
	mkdir -p $(STAGING_TARGET_DIR)/opt/vc
	$(CP) $(WRKINST)/opt/vc/lib $(STAGING_TARGET_DIR)/opt/vc
	$(CP) $(WRKINST)/opt/vc/include $(STAGING_TARGET_DIR)/opt/vc

bcm28xx-vc-gl-libs-install:
	$(INSTALL_DIR) $(IDIR_BCM28XX_VC_GL_LIBS)/opt/vc/lib
	$(CP) $(WRKINST)/opt/vc/lib/libmmal*.so \
		$(IDIR_BCM28XX_VC_GL_LIBS)/opt/vc/lib
	$(CP) $(WRKINST)/opt/vc/lib/libopenmaxil.so \
		$(IDIR_BCM28XX_VC_GL_LIBS)/opt/vc/lib
	$(CP) $(WRKINST)/opt/vc/lib/libEGL.so \
		$(IDIR_BCM28XX_VC_GL_LIBS)/opt/vc/lib
	$(CP) $(WRKINST)/opt/vc/lib/libGLESv2.so \
		$(IDIR_BCM28XX_VC_GL_LIBS)/opt/vc/lib
	$(CP) $(WRKINST)/opt/vc/lib/libOpenVG.so \
		$(IDIR_BCM28XX_VC_GL_LIBS)/opt/vc/lib
	(cd $(IDIR_BCM28XX_VC_GL_LIBS)/opt/vc/lib && ln -sf libEGL.so libEGL.so.1)

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
