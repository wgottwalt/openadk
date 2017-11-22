# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

# always use tab spaces as separator, no spaces
PKG_NAME:=		ajstarks-openvg
PKG_VERSION:=		a236978e8009c948083bd15b201d8f4ceb3c035d
PKG_GIT:=		hash
PKG_RELEASE:=		2
PKG_DESCR:=		openvg utility library
PKG_BUILDDEP:=		bcm28xx-vc freetype libjpeg-turbo
PKG_SECTION:=		libs/video
PKG_DEPENDS:=		bcm28xx-vc bcm28xx-vc-libs libfreetype libjpeg-turbo
PKG_URL:=		https://github.com/ajstarks/openvg
PKG_SITES:=		https://github.com/ajstarks/openvg.git

PKG_SYSTEM_DEPENDS:=	raspberry-pi raspberry-pi2 raspberry-pi3 raspberry-pi3-64

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,AJSTARKS_OPENVG,ajstarks-openvg,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

do-build:
	${MAKE} -C ${WRKBUILD} library

# please install all files and directories to the package dir


ajstarks-openvg-install:
	$(INSTALL_DIR) $(IDIR_AJSTARKS_OPENVG)/usr/lib
	$(INSTALL_BIN) $(WRKBUILD)/lib*.so \
		$(IDIR_AJSTARKS_OPENVG)/usr/lib

	${INSTALL_DIR} $(STAGING_TARGET_DIR)/usr/include
	$(CP) $(WRKBUILD)/shapes.h $(STAGING_TARGET_DIR)/usr/include
	$(CP) $(WRKBUILD)/fontinfo.h $(STAGING_TARGET_DIR)/usr/include

# please remove ALL above comments, before commiting
include $(ADK_TOPDIR)/mk/pkg-bottom.mk
