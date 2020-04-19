# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

# always use tab spaces as separator, no spaces
PKG_NAME:=		forte
PKG_VERSION:=		1.12.0
PKG_RELEASE:=		1
PKG_HASH:=		65541d5f682c386206f5fdee6a5663c19b3274ee6002b764a0314c49994c280c
PKG_DESCR:=		IEC61499 runtime
PKG_SECTION:=		libs/misc	
PKG_DEPENDS:=		libmodbus	
#PKG_BUILDDEP:=		add packages which need to be compiled
PKG_URL:=		https://www.eclipse.org/4diac/
PKG_SITES:=		http://ftp-stud.fht-esslingen.de/pub/Mirrors/eclipse/4diac/releases/1.12/forte/
DISTFILES:=             $(PKG_NAME)-incubation_$(PKG_VERSION).zip
WRKDIST=		$(WRKDIR)/$(PKG_NAME)-incubation_$(PKG_VERSION)

include $(ADK_TOPDIR)/mk/package.mk


$(eval $(call PKG_template,FORTE,forte,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

CONFIG_STYLE:=		cmake	
CMAKE_FLAGS:=		-G "Unix Makefiles" -DFORTE_ARCHITECTURE=Posix -DFORTE_COM_ETH=ON -DFORTE_COM_FBDK=ON \
			-DFORTE_COM_LOCAL=ON -DFORTE_TESTS=OFF -DFORTE_MODULE_CONVERT=ON \
			-DFORTE_MODULE_IEC61131=ON -DFORTE_MODULE_UTILS=ON

# please install all files and directories to the package dir
forte-install:
	$(INSTALL_DIR) $(IDIR_FORTE)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/forte \
		$(IDIR_FORTE)/usr/bin

# please remove ALL above comments, before commiting
include $(ADK_TOPDIR)/mk/pkg-bottom.mk
